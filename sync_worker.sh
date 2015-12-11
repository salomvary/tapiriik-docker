#!/bin/sh
set -euf

# Wait for RabbitMQ to boot up
while ! nc -q 1 rabbitmq 5672 </dev/null; do sleep 1; done

# The worker shuts down after completing n tasks
# https://github.com/cpfair/tapiriik/issues/191#issuecomment-164065625
while true; do
	# Chokes on non-absolute path!
	python3 /tapiriik/sync_worker.py
done
