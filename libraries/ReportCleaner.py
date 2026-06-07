import re
import pathlib

GITHUB_BASE_URL = "https://github.com/lizethheredia/robot-framework-automation/blob/main"


def clean_report_paths(results_dir="results"):
    """Replace absolute runner paths in Robot Framework HTML reports with GitHub source URLs."""
    for f in pathlib.Path(results_dir).glob("*.html"):
        content = f.read_text()
        content = re.sub(
            r"/home/runner/work/[^/]+/[^/]+/",
            f"{GITHUB_BASE_URL}/",
            content
        )
        f.write_text(content)


if __name__ == "__main__":
    clean_report_paths()
