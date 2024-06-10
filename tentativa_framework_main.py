from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from databases import Database
from sqlalchemy import create_engine, MetaData, Table, Column, Integer, String

DATABASE_URL = "postgresql://user:password@localhost:5432/mydatabase"

database = Database(DATABASE_URL)
metadata = MetaData()

cursos = Table(
    "cursos",
    metadata,
    Column("id_curso", Integer, primary_key=True),
    Column("nome_do_curso", String),
    Column("qnt_cadeiras", String),
    Column("preco_curso", String),
)

engine = create_engine(DATABASE_URL)
metadata.create_all(engine)

app = FastAPI()

class CursoModel(BaseModel):
    id_curso: int
    nome_do_curso: str
    qnt_cadeiras: str
    preco_curso: str

@app.on_event("startup")
async def startup():
    await database.connect()

@app.on_event("shutdown")
async def shutdown():
    await database.disconnect()

@app.post("/curso/")
async def create_curso(curso: CursoModel):
    query = cursos.insert().values(id_curso=curso.id_curso, nome_do_curso=curso.nome_do_curso, qnt_cadeiras=curso.qnt_cadeiras, preco_curso=curso.preco_curso)
    last_record_id = await database.execute(query)
    return {**curso.dict(), "id": last_record_id}

@app.get("/curso/{id_curso}")
async def read_curso(id_curso: int):
    query = cursos.select().where(cursos.c.id_curso == id_curso)
    curso = await database.fetch_one(query)
    if curso is None:
        raise HTTPException(status_code=404, detail="Curso não encontrado")
    return curso

@app.put("/curso/{id_curso}")
async def update_curso(id_curso: int, curso: CursoModel):
    query = cursos.update().where(cursos.c.id_curso == id_curso).values(nome_do_curso=curso.nome_do_curso, qnt_cadeiras=curso.qnt_cadeiras, preco_curso=curso.preco_curso)
    await database.execute(query)
    return {**curso.dict(), "id": id_curso}

@app.delete("/curso/{id_curso}")
async def delete_curso(id_curso: int):
    query = cursos.delete().where(cursos.c.id_curso == id_curso)
    await database.execute(query)
    return {"message": "Curso excluído com sucesso!"}
 
