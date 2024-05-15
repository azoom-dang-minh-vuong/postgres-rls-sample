import { drizzle } from 'drizzle-orm/postgres-js'
import postgres from 'postgres'
import schema from './schema'

const queryClient = postgres('postgres://2:my_strong_password@localhost:5432/pg-db')
const db = drizzle(queryClient, {
  schema,
})

export { db }
