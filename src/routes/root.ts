import { FastifyPluginAsync } from 'fastify'
import { todoType } from '../core/utils/TaskResult.gen';

const root: FastifyPluginAsync = async (fastify, opts): Promise<void> => {
  fastify.get('/', async function (request, reply) {
    reply.send({ hello: "Hello world" });
  });

  fastify.get('/books', async (request, reply) => {
    const books = [
      { id: 1, title: "Naruto" },
      { id: 2, title: "One Piece" },
      { id: 3, title: "DBZ" },
    ];

    const todos: todoType[] = [
      { name: "Manger", status: true }
    ]
    console.log(todos);
    reply.send(books);
  });
  
};

export default root;
