pee913adb7f54f1911e5c7ublish_bucket = cloudbees-clickstack
publish_repo = testing
publish_url = s3://$(publish_bucket)/$(publish_repo)/

deps = lib/newrelic.jar

pkg_files = README LICENSE setup functions lib

include plugin.mk

newrelic_ver = 3.9.0
newrelic_agent_src = http://repo1.maven.org/maven2/com/newrelic/agent/java/newrelic-agent/$(newrelic_ver)/newrelic-agent-$(newrelic_ver).jar
plugin_name = newrelic-java-plugin-$(newrelic_ver)
newrelic_md5 = ce93cfbae4d243bb57fc69b3318d4afc

lib/newrelic.jar:
	mkdir -p lib
	curl -fLo lib/newrelic.jar "$(newrelic_agent_src)"
	echo "$(newrelic_md5) $(newrelic_agent_src)"
	$(call check-md5,$(newrelic_agent_src),$(newrelic_md5))
