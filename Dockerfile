# download the base images of the system
FROM python:3.9

# create a working directory
WORKDIR /app

# copy all requirement thing to the directory
COPY requirements.txt .

#download and update some essential thing
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*
# download the all dependency
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install mysqlclient

# copt all over code from the local host machine
COPY . .

#port number
EXPOSE 8000 
