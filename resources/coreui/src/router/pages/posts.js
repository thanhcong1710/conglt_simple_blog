import u from '../../utilities/utility'
const PostsList = () => import('../../views/posts/list')
const PostsAdd = () => import('../../views/posts/add')
const PostsEdit = () => import('../../views/posts/edit')

export default {
  router: {
    path: '/posts',
    name: '',
    component: {
      render (c) {
        return c('router-view')
      }
    },
    children: [
      {
        path: '/posts',
        name: 'Danh Sách Bài Viết',
        component: PostsList
      },
      {
        path: '/posts/add',
        name: 'Thêm Mới Bài Viết',
        component: PostsAdd
      },
      {
        path: '/posts/:id/edit',
        name: 'Cập Nhật Bài Viết',
        component: PostsEdit
      },
    ]
  }
}
