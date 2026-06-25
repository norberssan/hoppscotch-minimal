-- Seed InfraConfig with mailer, auth provider, and onboarding settings.
-- Uses ON CONFLICT DO UPDATE so re-runs are idempotent.
INSERT INTO "InfraConfig" (id, name, value, "isEncrypted", "updatedOn")
VALUES
  (gen_random_uuid(), 'MAILER_SMTP_ENABLE',         'true',                                    false, now()),
  (gen_random_uuid(), 'MAILER_USE_CUSTOM_CONFIGS',   'true',                                    false, now()),
  (gen_random_uuid(), 'MAILER_ADDRESS_FROM',          'Hoppscotch <no-reply@hoppscotch.local>', false, now()),
  (gen_random_uuid(), 'MAILER_SMTP_HOST',             'mailpit',                                false, now()),
  (gen_random_uuid(), 'MAILER_SMTP_PORT',             '1025',                                   false, now()),
  (gen_random_uuid(), 'MAILER_SMTP_SECURE',           'false',                                  false, now()),
  (gen_random_uuid(), 'MAILER_TLS_REJECT_UNAUTHORIZED','false',                                  false, now()),
  (gen_random_uuid(), 'VITE_ALLOWED_AUTH_PROVIDERS',  'EMAIL',                                  false, now()),
  (gen_random_uuid(), 'ONBOARDING_COMPLETED',         'true',                                   false, now())
ON CONFLICT (name) DO UPDATE SET value = EXCLUDED.value;
