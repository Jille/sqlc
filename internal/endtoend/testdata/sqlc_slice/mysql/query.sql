CREATE TABLE foo (id int not null, name text not null, bar text null);

/* name: FuncParamIdent :many */
SELECT name FROM foo
WHERE name = sqlc.arg(slug)
  AND id IN (sqlc.slice(favourites));

/* name: FuncParamString :many */
SELECT name FROM foo
WHERE name = sqlc.arg('slug')
  AND id IN (sqlc.slice('favourites'));

/* name: FuncParamSoloArg :many */
SELECT name FROM foo
WHERE id IN (sqlc.slice('favourites'));

/* name: SliceExec :exec */
UPDATE foo SET name = sqlc.arg(slug)
WHERE id IN (sqlc.slice(favourites));

/* name: FuncNullable :many */
SELECT bar FROM foo
WHERE id IN (sqlc.slice('favourites'));