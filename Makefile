plugin_name = newrelic-java-plugin
publish_bucket = cloudbees-clickstack
publish_repo = dev
publish_url = s3://$(publish_bucket)/$(publish_repo)/

deps = lib/newrelic.jar

pkg_files = README LICENSE setup functions lib

include plugin.mk

newrelic_ver = 2.10
newrelic_agent_src = http://cloudbees-downloads.s3.amazonaws.com/appserver/newrelic-$(newrelic_ver).jar

lib/newrelic.jar:
	mkdir -p lib
	curl -fLo lib/newrelic.jar "$(newrelic_agent_src)"
