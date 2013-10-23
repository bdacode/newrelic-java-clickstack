publish_bucket = cloudbees-clickstack
publish_repo = testing
publish_url = s3://$(publish_bucket)/$(publish_repo)/

deps = lib/newrelic.jar

pkg_files = README LICENSE setup functions lib

include plugin.mk

newrelic_ver = 3.1.0
newrelic_agent_src = http://cloudbees-downloads.s3.amazonaws.com/appserver/newrelic-$(newrelic_ver).jar
plugin_name = newrelic-java-plugin-$(newrelic_ver)
newrelic_md5 = 85819da9bfc07dfd3e817b93dc85a969

lib/newrelic.jar:
	mkdir -p lib
	curl -fLo lib/newrelic.jar "$(newrelic_agent_src)"
	echo "$(newrelic_md5) $(newrelic_agent_src)"
	$(call check-md5,$(newrelic_agent_src),$(newrelic_md5))
