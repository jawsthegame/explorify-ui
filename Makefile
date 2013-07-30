compile:
	@./node_modules/.bin/hem build

upload:
	@s3cmd sync --acl-public ./public/ s3://explorify.jawsapps.com

clean:
	@rm -f ./public/application.*

deploy: clean compile upload clean
