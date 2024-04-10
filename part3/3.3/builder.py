import sys
from subprocess import run
from git import Repo

base_url='https://github.com/'
local_address='/Users/mizhonka/python-clone/local_dir'

def clone(r):
    x = r.split('/')
    repo_owner = x[0]
    repo_name = x[1]
    git_url = base_url + repo_owner + '/' + repo_name + '.git'
    repo = Repo.clone_from(git_url, local_address)

def build(d):
    x = d.split('/')
    docker_username=x[0]
    image_name=x[1]
    run(['docker', 'build', '-f', local_address + '/Dockerfile', '-t', docker_username+'/'+image_name, local_address])

def push(d):
    x = d.split('/')
    docker_username=x[0]
    image_name=x[1]
    docker_command=image_name+':latest'
    run(['docker', 'push', docker_username + '/' + docker_command])

if __name__ == "__main__":
    repo_param = sys.argv[1]
    docker_param = sys.argv[2]
    clone(repo_param)
    build(docker_param)
    push(docker_param)
