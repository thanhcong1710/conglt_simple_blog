import u from '../../utilities/utility'
const BlogsList = () => import('../../views/blogs/list')
const BlogsDetail = () => import('../../views/blogs/detail')

export default {
  router: {
    path: '/blogs',
    name: '',
    component: {
      render (c) {
        return c('router-view')
      }
    },
    children: [
      {
        path: '/blogs',
        name: 'Blogs',
        component: BlogsList
      },
      {
        path: '/blogs/:id/detail',
        name: 'Chi Tiết Bài Viết',
        component: BlogsDetail
      },
    ]
  }
}
