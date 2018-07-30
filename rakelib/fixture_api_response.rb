# frozen_string_literal: true

class FixtureAPIResponse # :nodoc:
  attr_reader :method, :port, :path, :params, :api_token, :name

  REQUESTS = %w(get post patch delete multipart)

  def initialize
    @method, @port, @path, @params, @api_token, @name = ""
    build_request_and_save_fixture
  end

  def build_request_and_save_fixture
    method_gets
    port_gets
    path_gets
    params_gets
    api_token_gets
    name_gets
    execute_request
  end

  private

    def execute_request
      puts "Generando..."
      system(send(method) + path_to_save_fixture)
      puts "Fixture generado! > #{path_to_save_fixture.split(" ").last}"
    end

    def method_gets
      loop do
        puts "Qué tipo de petición desea hacer? (1) GET (2) POST (3) PATCH/PUT (4) DELETE (5) MULTIPART"
        @method = STDIN.gets.chomp.to_i

        if method >= 1 && !REQUESTS[method - 1].nil?
          @method = REQUESTS[method - 1]
          break
        else
          puts "Seleccione una opción correcta!"
        end
      end
    end

    def port_gets
      puts "Cuál es el puerto?"
      @port = STDIN.gets.chomp
    end

    def path_gets
      puts "Cuál es la ruta?"
      @path = STDIN.gets.chomp
    end

    def params_gets
      return if method == "get" || method == "delete"

      puts "Proporcione los datos a enviar:"
      @params = STDIN.gets.chomp
    end

    def api_token_gets
      puts "Proporcione un token_token válido:"
      @api_token = STDIN.gets.chomp
    end

    def name_gets
      puts "Qué nombre tendra el archivo fixture?"
      @name = STDIN.gets.chomp
    end

    def request_url
      "'localhost:#{port}#{path}'"
    end

    def headers
      "-H 'Content-Type: application/json' " \
      "#{header_api_token}" \
      "-H 'Accept: application/vnd.creditar.v1+json'"
    end

    def header_api_token
      "-H 'Authorization: Token token=#{api_token}' "
    end

    def path_to_save_fixture
      filename = name.empty? ? DateTime.now.to_s(:number) : name
      " > ./test/fixtures/#{filename}.txt"
    end

    def body
      "-d '#{params}'"
    end

    def get
      "curl -X GET -is #{request_url} #{headers}"
    end

    def post
      "curl -X POST -is #{request_url} #{headers} #{body}"
    end

    def patch
      "curl -X PATCH -is #{request_url} #{headers} #{body}"
    end

    def delete
      "curl -X DELETE -is #{request_url} #{headers}"
    end

    def multipart
      "curl #{params} #{header_api_token} -is #{request_url}"
    end
end
