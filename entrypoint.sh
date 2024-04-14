#!/usr/bin/env bash
 
service --status-all
service ssh restart
service --status-all
 
exec "$@"