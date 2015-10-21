#!/usr/bin/env python3
import subprocess
import sys
import platform


def github_url_from_remote(u):
    if u.startswith('https://'):
        return u

    repo = u.split(':')[1]
    repo = repo[:-4]

    return 'https://github.com/{}'.format(repo)


def github_url_from_remote_output(output):
    origin = [s for s in output.splitlines() if 'origin' in s]
    pull_origin = [s for s in origin if 'push' in s][0]
    pull_url = pull_origin.split()[1]

    return github_url_from_remote(pull_url)


def get_remote():
    try:
        raw = subprocess.check_output('git remote -v'.split(),
                                      stderr=subprocess.DEVNULL)
    except subprocess.CalledProcessError:
        return None

    return github_url_from_remote_output(raw.decode('ascii'))


def open_url(url):
    if 'Darwin' in platform.system():
        command = 'open {url}'.format(url=url).split()
    else:
        command = 'xdg-open {url}'.format(url=url).split()

    subprocess.call(command,
                    stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)


def main():
    if len(sys.argv) > 1:
        url = 'https://github.com/{repo}'.format(repo=sys.argv[1])
        open_url(url)
        return

    remote = get_remote()
    if remote is None:
        print('No remote')

    open_url(remote)

if __name__ == '__main__':
    main()
