""" """

import pathlib
import subprocess
import sys
import logging
import os

# save log in a file:
os.chdir(pathlib.Path(__file__).parent)
logging.basicConfig(filename="minimize_tinytex_for_rendercv.log", level=logging.INFO)
os.chdir(pathlib.Path(__file__).parent.parent.parent)

# ine ach run, you should create a new recycle bin like fiqus folders
base_directory = pathlib.Path(__file__).parent
recycle_bin = base_directory / "recycle_bin_newest_smallfiles"
recycle_bin.mkdir(exist_ok=True)


def run_rendercv():
    response = subprocess.run(
        [sys.executable, "-m", "pytest", "tests/test_renderer.py"]
    )
    if response.returncode != 0:
        raise RuntimeError(f"Error running rendercv: {response}")


def remove_a_file_or_directory(directory: pathlib.Path):
    if directory.is_file():
        directory.unlink()
    elif directory.is_dir():
        for file_or_directory in directory.iterdir():
            if file_or_directory.is_file():
                file_or_directory.unlink()
            elif file_or_directory.is_dir():
                remove_a_file_or_directory(file_or_directory)
            else:
                raise RuntimeError(f"Unknown file type: {file_or_directory}")

    if directory.is_dir():
        directory.rmdir()


def compute_file_or_directory_size(file_or_directory: pathlib.Path):
    if file_or_directory.is_file():
        return file_or_directory.stat().st_size
    elif file_or_directory.is_dir():
        return sum(
            compute_file_or_directory_size(f) for f in file_or_directory.iterdir()
        )
    else:
        raise RuntimeError(f"Unknown file type: {file_or_directory}")


def move_a_directory_into_another_directory_and_skip_duplicates(
    source_directory: pathlib.Path, destination_directory: pathlib.Path
):
    for file_or_directory in source_directory.iterdir():
        destination_file_or_directory = destination_directory / file_or_directory.name

        if file_or_directory.is_file():
            if destination_file_or_directory.exists():
                continue
            file_or_directory.rename(destination_file_or_directory)
        elif file_or_directory.is_dir():
            move_a_directory_into_another_directory_and_skip_duplicates(
                file_or_directory, destination_file_or_directory
            )
        else:
            raise RuntimeError(f"Unknown file type: {file_or_directory}")


def delete_each_file_and_test_rendercv(
    directory,
    ignored_files_or_directories=[],
    ignore_files_below_this_mb=0.0,
    recursion_depth=None,
):
    failed_directories: list[pathlib.Path] = []
    for file_or_directory in pathlib.Path(directory).iterdir():
        if file_or_directory.name in ignored_files_or_directories:
            continue

        # check the file size and skip if it's smaller than 1MB:
        file_or_directory_size = compute_file_or_directory_size(file_or_directory)
        if file_or_directory_size < ignore_files_below_this_mb * 1e6:
            continue
        elif file_or_directory.is_file():
            # move to recycle bin but include it's parent directories under recycle_bin
            recycle_bin_file_or_directory = recycle_bin / file_or_directory.relative_to(
                base_directory
            )
            # create parent directories if they don't exist
            recycle_bin_file_or_directory.parent.mkdir(parents=True, exist_ok=True)

            file_or_directory.rename(recycle_bin_file_or_directory)
        elif file_or_directory.is_dir():
            # move to recycle bin but include it's parent directories under recycle_bin
            recycle_bin_file_or_directory = recycle_bin / file_or_directory.relative_to(
                base_directory
            )
            # create parent directories if they don't exist
            recycle_bin_file_or_directory.parent.mkdir(parents=True, exist_ok=True)

            # if directory exists, move the contents inside:
            if recycle_bin_file_or_directory.exists():
                raise RuntimeError(
                    "Create a new recycle bin and try again. This one already exists."
                )

            else:
                file_or_directory.rename(recycle_bin_file_or_directory)
        else:
            raise RuntimeError(f"Unknown file type: {file_or_directory}")

        try:
            run_rendercv()
        except RuntimeError:
            logging.info(f"Error after deleting {file_or_directory}")

            # move back to original location
            remove_a_file_or_directory(file_or_directory)
            recycle_bin_file_or_directory.rename(file_or_directory)

            # if it was a directory, append to directories
            if file_or_directory.is_dir():
                failed_directories.append(file_or_directory)
        else:
            logging.info(f"Ran successfully after deleting {file_or_directory}")

    if recursion_depth is None or recursion_depth > 0:
        if recursion_depth is not None:
            new_recursion_depth = recursion_depth - 1
        else:
            new_recursion_depth = None
        for directory in failed_directories:
            delete_each_file_and_test_rendercv(
                directory,
                ignored_files_or_directories,
                recursion_depth=new_recursion_depth,
            )


ignored_files_or_directories = [
    "bin",
    "LICENSE.CTAN",
    "LICENSE.TL",
    "release-texlive.txt",
]
delete_each_file_and_test_rendercv(
    base_directory / "TinyTeX",
    ignored_files_or_directories,
    ignore_files_below_this_mb=0.1,
    recursion_depth=None,
)
