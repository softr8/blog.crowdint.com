$ ->
  PostsApp.EditPostView = Backbone.View.extend
    events:
      'click .cancel' : 'cancelPost'
      'click .update' : 'updatePost'

    template:
      JST["templates/admin/posts/edit"]

    render: ->
      this.model.fetch()
      this.$el.html(this.template({post: this.model.toJSON(), isNew: this.model.isNew()}))
      this

    cancelPost: (e) ->
      e.preventDefault()
      this.goHome()

    updatePost: (e) ->
      e.preventDefault()
      this.model.save(this.extractData())
      this.goHome()

    extractData: ->
      {
        'body' : this.$('#post_body').val(),
        'title' : this.$('#post_title').val()
      }

    goHome: ->
      PostsApp.router.navigate '/'
        trigger: true
