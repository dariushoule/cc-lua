from fastapi import APIRouter, HTTPException

router = APIRouter()


@router.get("/go")
async def scripts_get():
    return "test"


@router.get("/scripts/")
async def scripts_get():
    return [{"name": "Item Foo"}, {"name": "item Bar"}]

