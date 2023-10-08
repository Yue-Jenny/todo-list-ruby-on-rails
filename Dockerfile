# 使用 ruby:alpine3.18 作為基礎映像
FROM --platform=linux/amd64 ruby:alpine3.18 as base_image

# 安裝必要的套件
RUN apk add build-base \
    libpq-dev \
    tzdata

# 安裝 rails 指令
RUN gem install rails

# 設定工作目錄
WORKDIR /app

# 複製 Gemfile 和 Gemfile.lock 到工作目錄
COPY ./Gemfile ./
COPY ./Gemfile.lock ./

# 安裝套件
RUN bundle install

# 複製整個 Rails 應用程序到容器
COPY . .

# 指定容器會暴露的埠號
EXPOSE 3000

# 啟動服務指令
CMD ["rails", "server", "-b", "0.0.0.0"]
