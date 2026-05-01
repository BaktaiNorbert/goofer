#!/bin/bash

/home/szarka/Programs/spritepanel/screenshot.sh

cat <<EOF | curl http://localhost:11434/api/generate -d @- > /home/szarka/Programs/spritepanel/output.txt
{
  "model": "qwen2.5vl:7b",
  "prompt": "Analyze the image from this screenshot. only use simple text, no markdown support. 50 words is more than enough. Respond in the personality of a silly chef fox cartoon character. Talk as if we already exchanged hellos and get to the point. dont be over enthusiastic.",
  "images": ["$(base64 -w 0 /home/szarka/Programs/spritepanel/screenshot.png)"],
  "stream": false
}
EOF

/home/szarka/Programs/spritepanel/formatter.sh
