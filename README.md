# Gerrit Docker image with AI integrations

Gerrit Code Review Docker image from [GerritForge](https://www.gerritforge.com)
including the native integration with the popular AI engines:

- [Anthropic's Claude](https://claude.com/)
- [OpenAI ChatGPT](https://chatgpt.com/)
- [Google's Gemini](https://gemini.google.com/)
- [Meta's Ollama](https://ollama.com/)
- [OpenRouter](https://openrouter.ai/)

## About Gerrit Code Review

Gerrit is a web-based code review system that enables teams to collaborate on Git
repositories with powerful patchset based review workflows, fine-grained permissions,
and seamless integration with CI/CD pipelines.

Gerrit is based on Git and uses a **patchset-based workflow**, treating every commit as
a standalone change. Unlike standard pull requests, Gerrit acts as a _"gatekeeper,"_
ensuring no code enters the master branch without formal vetting.
This architecture enforces strict quality standards and prevents _"integration debt"_
by requiring approval before any code is permanently merged.

In massive projects like **Android and Chromium**, Gerrit’s granular permission model
is essential for managing thousands of contributors. It allows leads to delegate
authority over specific sub-directories, ensuring only subject matter experts can
approve critical changes. By integrating with automated CI/CD pipelines, Gerrit ensures
every patch is verified by bots before human review, maintaining stability across
millions of lines of code.

The platform fosters **shared ownership** through side-by-side diffs and inline commenting.
Key features include **Change-IDs** for tracking iterations of a single fix and a
customizable **voting system** (e.g., custom score labels for reviews, validations, compliance,
security, ...) to formalize consensus. For large enterprises, its robust REST API and
plugin support allow it to seamlessly bridge the gap between development, automated testing,
and security auditing.

## Code-Review in the age of AI

In the era of AI-assisted development, Gerrit’s stacked commit model provides a critical
bridge between high-speed code generation and human-led verification. While AI tools
can generate vast amounts of code instantly, reviewing large, monolithic "blobs" of AI output
is error-prone for humans. Gerrit solves this by encouraging stacked changes, where a large
AI-generated feature is broken into a sequence of small, logically dependent commits.

This allows a human reviewer (or an AI "junior reviewer" plugin) to validate the architectural
foundation in one commit, the business logic in the next, and the unit tests in a
third—ensuring that every layer of the AI’s contribution is scrutinized in manageable,
atomic steps rather than a single, overwhelming pull request.

## Quickstart guide to Gerrit Docker AI image

1. To start Gerrit in demo mode locally, run the following command:

   ```bash
   docker run -d -p 80:8080 -h localhost --rm --name gerrit-ai gerritforge/gerrit-ai
   ```

2. You can access the logs of the Gerrit console by inspecting the logs of the `gerrit-ai` container

   ```bash
   docker logs -f gerrit-ai
   ```

3. Wait until the `[main] INFO  com.google.gerrit.pgm.Daemon : Gerrit Code Review 3.14.0 ready` message to
   appears on the console fo the `gerrit-ai` container.

4. Open the http://localhost URL in the browser to show the Gerrit AI spash page.

   ![Gerrit AI Spash](/assets/images/gerrit-ai-spash.png)

5. Click on the **Configure AI** button and open the **User Settings** page in Gerrit UI


   ![AI Preferences](/assets/images/ai-preferences-page.png)

6. Select your AI model, add your API Key and click the *Add* button

7. Click on the **Gerrit** link on the top-left of the screen and click on any **Outgoing reviews**.

   ![Open Changes](/assets/images/open-changes.png)

8. Click on the **Review Agent** button with the _AI diamond_ icon on the toolbar for opening
   the AI agent chat.

   ![AI Chat](/assets/images/ai-chat.png)

9. Click on the **Help me with review** button for asking the AI to review the open change.
   Then scroll to the bottom of the chat and, after a few seconds, the LLM will produce its
   reviews and suggested changes.

   ![AI Chat](/assets/images/ai-review.png)








