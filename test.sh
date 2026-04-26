#!/bin/bash

echo "Running Test..."

if grep -q "Hello DevOps" index.html
then
  echo "Test Passed ✅"
  exit 0
else
  echo "Test Failed ❌"
  exit 1
fi