import * as operatingCompany from './schema/operating-company'
import * as operatingUser from './schema/operating-user'

const schema = {
  ...operatingCompany,
  ...operatingUser,
}

export default schema
