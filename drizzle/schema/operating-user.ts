import { relations } from 'drizzle-orm'
import { foreignKey, integer, pgTable, serial, varchar } from 'drizzle-orm/pg-core'
import { operatingCompany } from './operating-company'

export const operatingUser = pgTable('operating_user', {
  id: serial('id').primaryKey(),
  operatingCompanyId: integer('operating_company_id').notNull(),
  name: varchar('name', { length: 255 }).notNull(),
}, table => ({
  operatingCompanyFk: foreignKey({
    columns: [table.operatingCompanyId],
    foreignColumns: [operatingCompany.id],
    name: 'operating_user_operating_company_id_fk',
  }),
}))

export const operatingUserRelations = relations(operatingUser, ({ one }) => ({
  operatingCompany: one(operatingCompany, {
    fields: [operatingUser.operatingCompanyId],
    references: [operatingCompany.id],
  }),
}))
