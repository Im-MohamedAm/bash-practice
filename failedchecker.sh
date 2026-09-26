#!/bin/bash

failedlog() {

 if [[ "$1" == *.log ]]; then
 count=$(grep "failed" "$1" | wc -l)
  dis=$(grep "failed" "$1")

 echo "Failed login attempts:"
  echo "$dis"

  echo "Total failed attempts: $count"

  else
  echo "Please enter a file with .log extension"
  fi
}

echo "Enter a log file:"
read f

failedlog "$f"

echo "Finished"
```

