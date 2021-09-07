FROM nikolaik/python-nodejs:python3.8-nodejs16

WORKDIR /app

# copy the content of the local src directory to the working directory
COPY . .
RUN yarn install

RUN git clone --depth=1 https://github.com/twintproject/twint.git && \
	cd twint && \
	pip3 install . -r requirements.txt

RUN yarn run build
ENV HOST=0.0.0.0 PORT=5001
EXPOSE ${PORT}
# RUN tsc
CMD [ "node", "dist/" ]