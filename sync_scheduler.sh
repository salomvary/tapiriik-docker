#!/bin/sh
set -euf

# Wait for RabbitMQ to boot up
while ! nc -q 1 rabbitmq 5672 </dev/null; do sleep 1; done

python3 sync_scheduler.py
