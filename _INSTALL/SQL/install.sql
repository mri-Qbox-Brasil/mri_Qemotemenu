-- mri_Qemotemenu — schema
--
-- Convencao do projeto (.claude/rules/persistence.md):
--   * colunas JSON sao LONGTEXT utf8mb4_bin, SEM CHECK(json_valid)
--     (json_valid('') = 0 quebraria o INSERT; a validacao acontece no Lua)
--   * toda coluna de WHERE/ORDER BY tem indice
--   * InnoDB + utf8mb4

CREATE TABLE IF NOT EXISTS `mri_qemotemenu_players` (
    `citizenid`  VARCHAR(64) NOT NULL,
    `binds`      LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
    `settings`   LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `mri_qemotemenu_defaults` (
    `slot`       VARCHAR(16) NOT NULL,
    `emote`      VARCHAR(64) NOT NULL,
    `label`      VARCHAR(64) NULL DEFAULT NULL,
    `updated_by` VARCHAR(64) NULL DEFAULT NULL,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`slot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Padroes iniciais: exatamente os que o rpemotes-reborn tinha nas setas.
-- O slot RIGHT chamava-se `ultra_facepalm` mas rodava `wtf4`; mantido de
-- proposito para nao mudar o comportamento de quem ja jogava.
INSERT INTO `mri_qemotemenu_defaults` (`slot`, `emote`, `label`, `updated_by`) VALUES
    ('UP',    'salute',   NULL, 'install'),
    ('DOWN',  'assobiar', NULL, 'install'),
    ('LEFT',  'joia',     NULL, 'install'),
    ('RIGHT', 'wtf4',     NULL, 'install')
ON DUPLICATE KEY UPDATE `slot` = `slot`;
