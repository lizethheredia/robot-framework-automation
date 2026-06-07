import re
import pathlib


def clean_report_paths(results_dir="results"):
    """Remove absolute runner paths from Robot Framework HTML reports."""
    for f in pathlib.Path(results_dir).glob("*.html"):
        content = f.read_text()
        content = re.sub(r"/home/runner/work/[^/]+/[^/]+/", "", content)
        f.write_text(content)


if __name__ == "__main__":
    clean_report_paths()
