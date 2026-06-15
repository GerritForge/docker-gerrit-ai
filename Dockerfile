FROM gerritcodereview/gerrit:latest

ENV GERRIT_CI=https://gerrit-ci.gerritforge.com/job/
ENV GERRIT_AI_SCRIPTS=https://gerrit.googlesource.com/plugins/scripts/+/refs/heads/stable-3.14/ai
ENV AI_LLMS="gemini claude chatgpt llama openrouter"

COPY ./static /var/gerrit/static/
COPY gerrit-ai-entrypoint.sh /
COPY firstLogin.1000000 /var/gerrit/data/plugin-manager/
COPY index/changes_0088 /var/gerrit/index/
COPY git/ /var/gerrit/git/

ADD --chown=gerrit:gerrit $GERRIT_CI/plugin-scripting-groovy-provider-gh-bazel-master-stable-3.14/lastSuccessfulBuild/artifact/bazel-bin/plugins/groovy-provider/groovy-provider.jar /var/gerrit/plugins/
ADD --chown=gerrit:gerrit $GERRIT_CI//plugin-ai-review-agent-provider-gh-bazel-stable-3.14/lastSuccessfulBuild/artifact/bazel-bin/plugins/ai-review-agent-provider/ai-review-agent-provider.jar /var/gerrit/plugins/

RUN bash -c "for llm in $AI_LLMS; do curl $GERRIT_AI_SCRIPTS/ai-review-agent-\$llm-1.0.groovy'?format=TEXT' | base64 -d > /var/gerrit/plugins/ai-review-agent-\$llm-1.0.groovy; done"

ENTRYPOINT /gerrit-ai-entrypoint.sh
