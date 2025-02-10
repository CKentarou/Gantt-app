class LinkController < ApplicationController
  # CSRF対策を無効にする（APIエンドポイントとして使用するため）
  protect_from_forgery with: :null_session

  # リンクを更新するアクション
  def update
    # パラメータからリンクを取得し、属性を更新
    link = Link.find(params["id"])
    link.source = params["source"]
    link.target = params["target"]
    link.link_type = params["type"]
    link.save

    # 更新アクションの結果をJSON形式で返す
    render :json => {:action => "updated"}
  end

  # リンクを追加するアクション
  def add
    # パラメータから新しいリンクを作成
    link = Link.create( 
      :source => params["source"], 
      :target => params["target"], 
      :link_type => params["type"]
    )

    # 挿入アクションの結果をJSON形式で返す
    render :json => {:action => "inserted", :tid => link.id}
  end

  # リンクを削除するアクション
  def delete
    # パラメータからリンクを取得し、削除
    Link.find(params["id"]).destroy

    # 削除アクションの結果をJSON形式で返す
    render :json => {:action => "deleted"}
  end
end