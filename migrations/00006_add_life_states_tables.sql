-- +goose Up
-- +goose StatementBegin
CREATE TYPE life_state_id AS ENUM(
        'normal',
        'alien',
        'ghost',
        'mermaid',
        'servo',
        'spellcaster',
        'vampire',
        'werewolf'
);

CREATE TABLE life_states(
        id life_state_id PRIMARY KEY,
        name text NOT NULL
);

INSERT INTO life_states(id, name)
        VALUES
                --
('normal', 'Sim'),
('alien', 'Alien'),
('ghost', 'Ghost'),
('mermaid', 'Mermaid'),
('servo', 'Servo'),
('spellcaster', 'Spellcaster'),
('vampire', 'Vampire'),
('werewolf', 'Werewolf')
                --
;

-- +goose StatementEnd
-- +goose Down
-- +goose StatementBegin
DROP TABLE life_states;

DROP TYPE life_state_id;

-- +goose StatementEnd
