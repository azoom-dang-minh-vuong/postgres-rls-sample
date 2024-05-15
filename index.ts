import { db } from './drizzle'

async function main() {
  const operatingCompanies = await db.query.operatingCompany.findMany()
  const operatingUsers = await db.query.operatingUser.findMany()
  console.log({
    operatingCompanies,
    operatingUsers,
  })
}

main().then(() => {
  process.exit(0)
}).catch((err) => {
  console.error(err)
  process.exit(1)
})
