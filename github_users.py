import json
from urllib.error import HTTPError, URLError
from urllib.request import Request, urlopen


def main():
    for username in ("octocat", "torvalds", "gvanrossum"):
        request = Request(
            f"https://api.github.com/users/{username}",
            headers={"Accept": "application/vnd.github+json"},
        )
        try:
            with urlopen(request, timeout=10) as response:
                if response.status != 200:
                    print(f"{username}: HTTP {response.status}")
                    continue
                user = json.load(response)
        except HTTPError as error:
            print(f"{username}: HTTP {error.code}")
            continue
        except (URLError, TimeoutError) as error:
            print(f"{username}: request failed ({error})")
            continue

        print(f"{user['login']}: {user['public_repos']} public repositories")


if __name__ == "__main__":
    main()
