#!/bin/sh
# Run jstatd w/o error 'access denied (java.util.PropertyPermission java.rmi.server.ignoreSubClasses write)'
policy=${HOME}/.jstatd.all.policy
[ -r ${policy} ] || cat >${policy} <<'POLICY'
grant codebase "file:${java.home}/../lib/tools.jar" {
  permission java.security.AllPermission;
};
POLICY

jstatd -J-Djava.security.policy=${policy} &
