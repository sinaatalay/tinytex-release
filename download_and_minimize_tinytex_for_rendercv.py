import logging
import pathlib
import shutil
import subprocess
import sys
from venv import logger

import requests

# some important paths:
tinytex_release_path = pathlib.Path(__file__).parent
tinytex_path = tinytex_release_path / "TinyTeX"
log_path = tinytex_release_path / "download_and_minimize_tinytex_for_rendercv.log"
recycle_bin = tinytex_release_path / "recycle_bin"


logging.basicConfig(
    format="%(asctime)s %(levelname)-8s %(message)s",
    filename=log_path,
    level=logging.INFO,
    datefmt="%Y-%m-%d %H:%M:%S",
    # filemode="w",
)


def download_an_archive_and_extract(
    link: str, archive_path: pathlib.Path, extract_contents_to: pathlib.Path
):
    archive_path.write_bytes(requests.get(link).content)

    extracted_directory = extract_contents_to / "extraction"

    shutil.unpack_archive(
        archive_path,
        extracted_directory,
    )

    final_extraction_directory = extract_contents_to / archive_path.stem

    # move the contents of the extracted directory to the parent directory
    try:
        (extracted_directory / "TinyTeX").rename(final_extraction_directory)
    except FileNotFoundError:
        (extracted_directory / ".TinyTeX").rename(final_extraction_directory)

    # remove the archive:
    archive_path.unlink()


def download_tinytex_and_extract():
    logging.info("Downloading TinyTeX and extracting it has started.")

    # remove the existing TinyTeX directory
    if tinytex_path.exists():
        shutil.rmtree(tinytex_path)

    # download the files
    windows_link = "https://yihui.org/tinytex/TinyTeX.zip"
    macos_link = "https://yihui.org/tinytex/TinyTeX-1.tgz"
    linux_link = "https://yihui.org/tinytex/TinyTeX.tar.gz"

    tinytex_windows_archive = tinytex_release_path / "TinyTeX.zip"

    tinytex_macos_archive = tinytex_release_path / "TinyTeX-macos.tgz"
    tinytex_macos_path = tinytex_release_path / "TinyTeX-macos"
    tinytex_linux_archive = tinytex_release_path / "TinyTeX-linux.tar.gz"
    tinytex_linux_path = tinytex_release_path / "TinyTeX-linux.tar"

    download_an_archive_and_extract(
        windows_link, tinytex_windows_archive, tinytex_release_path
    )
    download_an_archive_and_extract(
        macos_link, tinytex_macos_archive, tinytex_release_path
    )
    download_an_archive_and_extract(
        linux_link, tinytex_linux_archive, tinytex_release_path
    )

    # move macos and linux binaries and remove macos and linux tinytex:
    required_binaries = ["pdftex", "pdflatex", "pdfetex"]
    macos_binaries_path = tinytex_path / "bin" / "universal-darwin"
    macos_binaries_path.mkdir(exist_ok=True)
    linux_binaries_path = tinytex_path / "bin" / "x86_64-linux"
    linux_binaries_path.mkdir(exist_ok=True)

    for required_binary in required_binaries:
        (tinytex_macos_path / "bin" / "universal-darwin" / required_binary).rename(
            macos_binaries_path / required_binary
        )
        (tinytex_linux_path / "bin" / "x86_64-linux" / required_binary).rename(
            linux_binaries_path / required_binary
        )

    # only keep these files in the TinyTeX/bin directory:
    windows_bin_path = tinytex_path / "bin" / "windows"
    files_to_keep = [
        windows_bin_path / "tlmgr.bat",
        windows_bin_path / "kpathsealibw64.dll",
        windows_bin_path / "msvcp140.dll",
        windows_bin_path / "pdflatex.exe",
        windows_bin_path / "pdftex.exe",
        windows_bin_path / "ucrtbase.dll",
        windows_bin_path / "vcruntime140.dll",
        windows_bin_path / "luatex.dll",
        windows_bin_path / "updmap.exe",
        windows_bin_path / "updmap-sys.exe",
        windows_bin_path / "updmap=user.exe",
        windows_bin_path / "mktexlsr.exe",
        windows_bin_path / "kpsewhich.exe",
        windows_bin_path / "ps2pdf12.exe",
        windows_bin_path / "ps2pdf13.exe",
        windows_bin_path / "ps2pdf14.exe",
        windows_bin_path / "ps2ps.exe",
        windows_bin_path / "repstopdf.exe",
        windows_bin_path / "rungs.exe",
        windows_bin_path / "runscript.dll",
        windows_bin_path / "runscript.exe",
        windows_bin_path / "runscript.tlu",
        windows_bin_path / "teckit_compile.exe",
        windows_bin_path / "tex.dll",
        windows_bin_path / "tex.exe",
        windows_bin_path / "texcount.exe",
        windows_bin_path / "texhash.exe",
        windows_bin_path / "texlua.exe",
        windows_bin_path / "texluac.exe",
        windows_bin_path / "thumbpdf.exe",
        windows_bin_path / "tlmgr.bat",
        windows_bin_path / "ucrtbase.dll",
        windows_bin_path / "updmap-sys.exe",
        windows_bin_path / "updmap-user.exe",
        windows_bin_path / "updmap.exe",
        windows_bin_path / "urlbst.exe",
        windows_bin_path / "vcruntime140_1.dll",
        windows_bin_path / "vcruntime140.dll",
        windows_bin_path / "wrunscript.exe",
        windows_bin_path / "xdvipdfmx.exe",
        windows_bin_path / "xelatex-unsafe.bat",
        windows_bin_path / "xelatex-unsafe.exe",
        windows_bin_path / "xelatex.exe",
        windows_bin_path / "xetex-unsafe.bat",
        windows_bin_path / "xetex-unsafe.exe",
        windows_bin_path / "xetex.dll",
        windows_bin_path / "xetex.exe",
    ]
    for file_or_directory in windows_bin_path.iterdir():
        if file_or_directory not in files_to_keep:
            remove_a_file_or_directory(file_or_directory)

    # install some packages:
    packages = ["paracol", "moderncv", "sourcesanspro"]

    for package in packages:
        run_tlmgr(["install", package])

    logging.info("Downloading TinyTeX and extracting it has finished.")


def run_tlmgr(args: list[str]):
    result = subprocess.run(
        [tinytex_path / "bin" / "windows" / "tlmgr.bat"] + args, capture_output=True
    )

    # if ERROR in stdout or stderr, raise an error
    if "ERROR" in result.stdout.decode() or "ERROR" in result.stderr.decode():
        # log the error
        logger.error(f'Error running "tlmgr {result.stderr.decode()}')
        raise RuntimeError("Error running tlmgr!")

    logger.info(f'Ran "tlmgr {" ".join(args)}"')


def test_rendercv():
    response = subprocess.run(
        [
            sys.executable,
            "-m",
            "pytest",
            "tests/test_renderer.py::test_latex_to_pdf",
        ]
    )
    if response.returncode != 0:
        raise RuntimeError(f"Error running rendercv: {response}")


def test_tlmgr():
    # run_tlmgr(["update", "--self"])
    # run_tlmgr(["update", "--all"])
    run_tlmgr(["install", "sourcesanspro"])
    run_tlmgr(["remove", "sourcesanspro"])
    run_tlmgr(["install", "sourcesanspro"])


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

        directory.rmdir()


def compute_file_or_directory_size(file_or_directory: pathlib.Path):
    if file_or_directory.is_file():
        return file_or_directory.stat().st_size
    elif file_or_directory.is_dir():
        return sum(
            compute_file_or_directory_size(f) for f in file_or_directory.iterdir()
        )


def move_a_directory_into_another_directory_and_skip_duplicates(
    source_directory: pathlib.Path, destination_directory: pathlib.Path
):
    for file_or_directory in source_directory.iterdir():
        destination_file_or_directory = destination_directory / file_or_directory.name

        if file_or_directory.is_file():
            if destination_file_or_directory.exists():
                continue

            # if destination directory doesn't exist, crete:
            if not destination_directory.exists():
                destination_directory.mkdir(parents=True, exist_ok=True)

            file_or_directory.rename(destination_file_or_directory)
        elif file_or_directory.is_dir():
            move_a_directory_into_another_directory_and_skip_duplicates(
                file_or_directory, destination_file_or_directory
            )


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
            # pass
            # move to recycle bin but include it's parent directories under recycle_bin
            recycle_bin_file_or_directory = recycle_bin / file_or_directory.relative_to(
                tinytex_release_path
            )
            # create parent directories if they don't exist
            recycle_bin_file_or_directory.parent.mkdir(parents=True, exist_ok=True)

            file_or_directory.rename(recycle_bin_file_or_directory)
            logger.info(f"Moved {file_or_directory} to recycle bin.")

            try:
                test_rendercv()
                test_tlmgr()
            except:
                logging.warning(f"Error after deleting {file_or_directory}")

                # move back to original location
                remove_a_file_or_directory(file_or_directory)
                recycle_bin_file_or_directory.rename(file_or_directory)

                logging.info(
                    f"Moved {file_or_directory} back to its original location."
                )

                # if it was a directory, append to directories
                if file_or_directory.is_dir():
                    failed_directories.append(file_or_directory)
            else:
                logging.info(f"Ran successfully after deleting {file_or_directory}")
        elif file_or_directory.is_dir():
            # move to recycle bin but include it's parent directories under recycle_bin
            recycle_bin_file_or_directory = recycle_bin / file_or_directory.relative_to(
                tinytex_release_path
            )
            # create parent directories if they don't exist
            recycle_bin_file_or_directory.parent.mkdir(parents=True, exist_ok=True)

            # if directory exists, move the contents inside:
            if recycle_bin_file_or_directory.exists():
                move_a_directory_into_another_directory_and_skip_duplicates(
                    file_or_directory, recycle_bin_file_or_directory
                )
            else:
                file_or_directory.rename(recycle_bin_file_or_directory)

            logger.info(f"Moved {file_or_directory} to recycle bin.")

            try:
                test_rendercv()
                test_tlmgr()
            except:
                logging.warning(f"Error after deleting {file_or_directory}")

                # move back to original location
                remove_a_file_or_directory(file_or_directory)
                recycle_bin_file_or_directory.rename(file_or_directory)

                logging.info(
                    f"Moved {file_or_directory} back to its original location."
                )

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


if __name__ == "__main__":
    # # # in each run, create a new recycle bin
    # if recycle_bin.exists():
    #     shutil.rmtree(recycle_bin, ignore_errors=True)

    # recycle_bin.mkdir(exist_ok=True)

    # download_tinytex_and_extract()

    try:
        test_rendercv()
    except RuntimeError:
        logging.error("Error running rendercv after downloading TinyTeX.")
        sys.exit(1)

    # ignored_files_or_directories = [
    #     "universal-darwin",
    #     "x86_64-linux",
    #     "LICENSE.CTAN",
    #     "LICENSE.TL",
    #     "release-texlive.txt",
    # ]

    # delete_each_file_and_test_rendercv(
    #     tinytex_path,
    #     ignored_files_or_directories,
    #     ignore_files_below_this_mb=0,
    #     recursion_depth=3,
    # )
