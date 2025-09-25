import {Pool} from 'pg';

const pool = new Pool({
    user: 'postgres',
    password: 'admin',
    host: 'localhost',
    port: 5432,
    database: 'chatter_db'
})

export default pool;