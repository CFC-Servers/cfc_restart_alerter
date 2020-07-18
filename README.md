# CFC Restart Alerter
Alerts to a URL when the server has restarted

## Purpose
We needed a way to send an alert to Discord when the server has fully restarted and is ready to join, doing it from within the game was the best option.

# Usage

## Setup

First, you'll need to have a backend server that _does_ something with this HTTP request. We have a simple web server that receives this requesst and fires off a Discord webhook, but you can do anything you'd like!

Next, you'll need to put the URL of your endpoint in `garrysmod/data/cfc/restart_alerter_endpoint.txt` (i.e. `http://localhost:2100/my/endpoint`)

And that's it! When your server restarts, it'll send an HTTP POST request to the endpoint you defined.
