import { pgTable, serial, varchar } from 'drizzle-orm/pg-core'

export const operatingCompany = pgTable('operating_company', {
  id: serial('id').primaryKey(),
  name: varchar('name', { length: 255 }).notNull(),
})
