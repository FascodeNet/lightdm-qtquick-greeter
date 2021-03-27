#!/usr/bin/env bash
spectool -g *spec
fedpkg --release f34 mockbuild --mock-config fedora-34-x86_64
