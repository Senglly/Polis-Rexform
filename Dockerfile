FROM boxyhq/jackson:latest

# Polis (Ory's SAML/OIDC bridge) is built on BoxyHQ SAML Jackson.
# All configuration is injected via environment variables at runtime.
# The entrypoint.sh validates required vars before starting the service.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 5225

ENTRYPOINT ["/entrypoint.sh"]
CMD ["node", "server.js"]
