#!/bin/bash

set -e

ANSIBLE_ENV_SETUP=vendor/ansible/hacking/env-setup
VIRTUALENV_SETUP=vendor/virtualenv/virtualenv.py
VIRTUALENV_TARGET_DIR=python
VIRTUALENV_ACTIVATE=$VIRTUALENV_TARGET_DIR/bin/activate
DEV_NULL=/dev/stdout

if [ ! -e $VIRTUALENV_SETUP ]; then
  echo "Not found: $VIRTUALENV_SETUP"
  echo "Did you forget to 'git submodule update --init --recursive'?"
  exit 1
fi

if [ ! -e $ANSIBLE_ENV_SETUP ]; then
  echo "Not found: $ANSIBLE_ENV_SETUP"
  echo "Did you forget to 'git submodule update --init --recursive'?"
  exit 1
fi

if [[ ! -e $VIRTUALENV_ACTIVATE ]]; then
  python $VIRTUALENV_SETUP $VIRTUALENV_TARGET_DIR &> $DEV_NULL
elif [ -e $VIRTUALENV_ACTIVATE ]; then
  echo "Skipping virtualenv install (already exists)"
fi

source $VIRTUALENV_ACTIVATE

if [[ -z $(pip show paramiko PyYAML Jinja2 httplib2) ]]; then
  if ! pip install paramiko PyYAML Jinja2 httplib2 &> $DEV_NULL; then
    echo "Failed: pip install"
    exit 1
  fi
fi

source $ANSIBLE_ENV_SETUP &> $DEV_NULL
ansible-playbook -i inventory --ask-become-pass main.yml
trap - EXIT