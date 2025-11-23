#!/bin/bash
set -e

echo "Starting nginx..."
sudo service nginx start

echo "nginx is running on port 80"
echo "Access your site at http://localhost"
