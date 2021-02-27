//
//  PostList.swift
//  Posts da Lelê
//
//  Created by Letícia on 26/02/21.
//

import UIKit

class PostListViewController: UIViewController {
    
    var tableView = UITableView()
    var posts: [Post] = []
    
    struct Posts {
        static let postCell = "PostCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        posts = fetchPost()
        title = "Posts da Lelê"
    }
    
    // MARK: Table View configurations
    
    func configTableView(){
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 100
        tableView.register(PostCell.self, forCellReuseIdentifier: Posts.postCell)
        tableView.pinView(to: view)
    }
    
    func setTableViewDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
    }
}
    // MARK: Table View extension DataSource and Delegate

extension PostListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Posts.postCell) as! PostCell
        let post = posts[indexPath.row]
        cell.set(post: post)
        return cell
    }
}

// MARK: PostData extension

extension PostListViewController {
    func fetchPost() -> [Post] {
        let post1 = Post(postName: "O que é MVC?", postImage: PostImages.mvc)
        let post2 = Post(postName: "Dicas de séries", postImage: PostImages.techTvShows)
        let post3 = Post(postName: "3 Dicas para você fazer seu readME.md", postImage: PostImages.readMe)
        let post4 = Post(postName: "Frase: Steve Jobs", postImage: PostImages.steveJobs)
        let post5 = Post(postName: "Ciclo de Vida da ViewController", postImage: PostImages.juniorDev)
        let post6 = Post(postName: "Core Data", postImage: PostImages.coreData)
        let post7 = Post(postName: "A importância do GitHub", postImage: PostImages.github)
        let post8 = Post(postName: "6 Podcasts pra você ouvir", postImage: PostImages.podcasts)
        let post9 = Post(postName: "Hello World!", postImage: PostImages.helloPrint)
        
        return [post1, post2, post3, post4, post5, post6, post7, post8, post9]
    }
}
