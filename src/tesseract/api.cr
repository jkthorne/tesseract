class Tesseract::API
  def initialize
    @handle = LibTesseract.base_api_create

    if LibTesseract.base_api_init3(@handle, nil, "eng") != 0
      raise "failed to initialize tesseract"
    end
  end

  def finalize
    LibTesseract.base_api_end(@handle)
    LibTesseract.base_api_delete(@handle)
  end

  def version
    String.new(LibTesseract.version)
  end

  def image(file : File) : String
    image(file.path)
  end

  def image(path : Path) : String
    image(path.expand)
  end

  def image(path : String) : String
    result = ""

    pix = Leptonica::Pix.new(path)

    # load image into tesseract
    LibTesseract.base_api_set_image2(@handle, pix)

    # run tesseract over image
    if LibTesseract.base_api_recognize(@handle, nil) != 0
      raise "image processing failed"
    end

    # get text from tesseract
    text = LibTesseract.base_api_get_utf8_text(@handle)
    if text == nil
      raise "text extraction failed"
    else
      result = String.new(text.dup)
    end

    # cleanup objects intesseract
    LibTesseract.delete_text(text)

    result
  end
end
