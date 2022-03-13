#!/usr/bin/env bash
spectool -g *spec
fedpkg --release f36 mockbuild --mock-config fedora-36-x86_64
