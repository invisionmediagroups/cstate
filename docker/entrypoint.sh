WORK_DIR="/app"
SRC_DIR="/cstatus"

# Check if the working dir is empty, if it is we'll need to copy
# the files in from src directory (usually /cstatus)
if ! [ "$(ls -A $WORK_DIR)" ]; then
    # First run, copy cstatus's files in.
    echo "First time run! Hello, World :)"
    cp -R $SRC_DIR/* $WORK_DIR
fi

# Continue with building

# CD into working dir
cd /app

# Build the hugo site
hugo

# Copy built files into NGINX directory
cp -r /app/public/* /usr/share/nginx/html
