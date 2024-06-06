# Lê o conteúdo do arquivo em linguagem NT e converte para HTML
def ler_arquivo_nt(text)
    conteudo = File.read(text)
  
    # Converte negrito e itálico para HTML
    conteudo.gsub!(/\*(.*?)\*/, '<strong>\1</strong>')
    conteudo.gsub!(/_(.*?)_/, '<i>\1</i>')
  
    # Converte listas para HTML
    conteudo.gsub!(/^- (.+)$/,'<li>\1</li>')
    conteudo.gsub!(/(<li>.*?<\/li>)/m, '<ul>\1</ul>')
  
    # Substitui quebras de linha duplas ou mais por um único parágrafo
    conteudo.gsub!(/\n\n+/, '</p><p>')
  
    # Adiciona <p> no início e </p> no final do conteúdo, se não estiver dentro de uma lista
    conteudo = '<p>' + conteudo unless conteudo.start_with?('<ul>')
    conteudo += '</p>' unless conteudo.end_with?('</ul>')
  
    # Substitui quebras de linha simples por espaço
    conteudo.gsub!(/\n/, ' ')
  
    # Remove tags de parágrafo extras
    conteudo.gsub!(/<p><\/p>/, '')
  
    # Salva o conteúdo traduzido em um novo arquivo HTML
    File.write("saida.html", conteudo)
  end
  
  # Chame a função com o nome do arquivo NT
  ler_arquivo_nt('artigo.nt')
