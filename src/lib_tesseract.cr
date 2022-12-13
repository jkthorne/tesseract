@[Link("tesseract")]
lib LibTesseract
  struct X_IoFile
    _flags : LibC::Int
    _io_read_ptr : LibC::Char*
    _io_read_end : LibC::Char*
    _io_read_base : LibC::Char*
    _io_write_base : LibC::Char*
    _io_write_ptr : LibC::Char*
    _io_write_end : LibC::Char*
    _io_buf_base : LibC::Char*
    _io_buf_end : LibC::Char*
    _io_save_base : LibC::Char*
    _io_backup_base : LibC::Char*
    _io_save_end : LibC::Char*
    _markers : X_IoMarker*
    _chain : X_IoFile*
    _fileno : LibC::Int
    _flags2 : LibC::Int
    _old_offset : X__OffT
    _cur_column : LibC::UShort
    _vtable_offset : LibC::Char
    _shortbuf : LibC::Char[1]
    _lock : X_IoLockT*
    _offset : X__Off64T
    _codecvt : X_IoCodecvt*
    _wide_data : X_IoWideData*
    _freeres_list : X_IoFile*
    _freeres_buf : Void*
    __pad5 : LibC::SizeT
    _mode : LibC::Int
    _unused2 : LibC::Char[20]
  end

  enum OcrEngineMode
    OemTesseractOnly         = 0
    OemLstmOnly              = 1
    OemTesseractLstmCombined = 2
    OemDefault               = 3
  end

  enum PageSegMode
    PsmOsdOnly             =  0
    PsmAutoOsd             =  1
    PsmAutoOnly            =  2
    PsmAuto                =  3
    PsmSingleColumn        =  4
    PsmSingleBlockVertText =  5
    PsmSingleBlock         =  6
    PsmSingleLine          =  7
    PsmSingleWord          =  8
    PsmCircleWord          =  9
    PsmSingleChar          = 10
    PsmSparseText          = 11
    PsmSparseTextOsd       = 12
    PsmRawLine             = 13
    PsmCount               = 14
  end

  enum PageIteratorLevel
    RilBlock    = 0
    RilPara     = 1
    RilTextline = 2
    RilWord     = 3
    RilSymbol   = 4
  end

  enum PolyBlockType
    PtUnknown        =  0
    PtFlowingText    =  1
    PtHeadingText    =  2
    PtPulloutText    =  3
    PtEquation       =  4
    PtInlineEquation =  5
    PtTable          =  6
    PtVerticalText   =  7
    PtCaptionText    =  8
    PtFlowingImage   =  9
    PtHeadingImage   = 10
    PtPulloutImage   = 11
    PtHorzLine       = 12
    PtVertLine       = 13
    PtNoise          = 14
    PtCount          = 15
  end

  enum Orientation
    OrientationPageUp    = 0
    OrientationPageRight = 1
    OrientationPageDown  = 2
    OrientationPageLeft  = 3
  end

  enum WritingDirection
    WritingDirectionLeftToRight = 0
    WritingDirectionRightToLeft = 1
    WritingDirectionTopToBottom = 2
  end

  enum TextlineOrder
    TextlineOrderLeftToRight = 0
    TextlineOrderRightToLeft = 1
    TextlineOrderTopToBottom = 2
  end

  enum ParagraphJustification
    JustificationUnknown = 0
    JustificationLeft    = 1
    JustificationCenter  = 2
    JustificationRight   = 3
  end

  type ResultRenderer = Void*
  type BaseApi = Void*
  type PageIterator = Void*
  type ResultIterator = Void*
  type MutableIterator = Void*
  type ChoiceIterator = Void*
  type File = X_IoFile
  type EtextDesc = Void*

  alias X_IoMarker = Void
  alias X__OffT = LibC::Long
  alias X_IoLockT = Void
  alias X__Off64T = LibC::Long
  alias X_IoCodecvt = Void
  alias X_IoWideData = Void
  alias Pix = Void
  alias Pixa = Void
  alias Boxa = Void
  alias CancelFunc = (Void*, LibC::Int -> LibC::Int)
  alias ProgressFunc = (EtextDesc, LibC::Int, LibC::Int, LibC::Int, LibC::Int -> LibC::Int)

  fun alto_renderer_create = TessAltoRendererCreate(outputbase : LibC::Char*) : ResultRenderer
  fun base_api_adapt_to_word_str = TessBaseAPIAdaptToWordStr(handle : BaseApi, mode : PageSegMode, wordstr : LibC::Char*) : LibC::Int
  fun base_api_all_word_confidences = TessBaseAPIAllWordConfidences(handle : BaseApi) : LibC::Int*
  fun base_api_analyse_layout = TessBaseAPIAnalyseLayout(handle : BaseApi) : PageIterator
  fun base_api_clear = TessBaseAPIClear(handle : BaseApi)
  fun base_api_clear_adaptive_classifier = TessBaseAPIClearAdaptiveClassifier(handle : BaseApi)
  fun base_api_clear_persistent_cache = TessBaseAPIClearPersistentCache(handle : BaseApi)
  fun base_api_create = TessBaseAPICreate : BaseApi
  fun base_api_delete = TessBaseAPIDelete(handle : BaseApi)
  fun base_api_detect_orientation_script = TessBaseAPIDetectOrientationScript(handle : BaseApi, orient_deg : LibC::Int*, orient_conf : LibC::Float*, script_name : LibC::Char**, script_conf : LibC::Float*) : LibC::Int
  fun base_api_end = TessBaseAPIEnd(handle : BaseApi)
  fun base_api_get_alto_text = TessBaseAPIGetAltoText(handle : BaseApi, page_number : LibC::Int) : LibC::Char*
  fun base_api_get_available_languages_as_vector = TessBaseAPIGetAvailableLanguagesAsVector(handle : BaseApi) : LibC::Char**
  fun base_api_get_bool_variable = TessBaseAPIGetBoolVariable(handle : BaseApi, name : LibC::Char*, value : LibC::Int*) : LibC::Int
  fun base_api_get_box_text = TessBaseAPIGetBoxText(handle : BaseApi, page_number : LibC::Int) : LibC::Char*
  fun base_api_get_component_images = TessBaseAPIGetComponentImages(handle : BaseApi, level : PageIteratorLevel, text_only : LibC::Int, pixa : Pixa**, blockids : LibC::Int**) : Boxa*
  fun base_api_get_component_images1 = TessBaseAPIGetComponentImages1(handle : BaseApi, level : PageIteratorLevel, text_only : LibC::Int, raw_image : LibC::Int, raw_padding : LibC::Int, pixa : Pixa**, blockids : LibC::Int**, paraids : LibC::Int**) : Boxa*
  fun base_api_get_connected_components = TessBaseAPIGetConnectedComponents(handle : BaseApi, cc : Pixa**) : Boxa*
  fun base_api_get_datapath = TessBaseAPIGetDatapath(handle : BaseApi) : LibC::Char*
  fun base_api_get_double_variable = TessBaseAPIGetDoubleVariable(handle : BaseApi, name : LibC::Char*, value : LibC::Double*) : LibC::Int
  fun base_api_get_hocr_text = TessBaseAPIGetHOCRText(handle : BaseApi, page_number : LibC::Int) : LibC::Char*
  fun base_api_get_init_languages_as_string = TessBaseAPIGetInitLanguagesAsString(handle : BaseApi) : LibC::Char*
  fun base_api_get_input_image = TessBaseAPIGetInputImage(handle : BaseApi) : Pix*
  fun base_api_get_input_name = TessBaseAPIGetInputName(handle : BaseApi) : LibC::Char*
  fun base_api_get_int_variable = TessBaseAPIGetIntVariable(handle : BaseApi, name : LibC::Char*, value : LibC::Int*) : LibC::Int
  fun base_api_get_iterator = TessBaseAPIGetIterator(handle : BaseApi) : ResultIterator
  fun base_api_get_loaded_languages_as_vector = TessBaseAPIGetLoadedLanguagesAsVector(handle : BaseApi) : LibC::Char**
  fun base_api_get_lstm_box_text = TessBaseAPIGetLSTMBoxText(handle : BaseApi, page_number : LibC::Int) : LibC::Char*
  fun base_api_get_mutable_iterator = TessBaseAPIGetMutableIterator(handle : BaseApi) : MutableIterator
  fun base_api_get_open_cl_device = TessBaseAPIGetOpenCLDevice(handle : BaseApi, device : Void**) : LibC::SizeT
  fun base_api_get_page_seg_mode = TessBaseAPIGetPageSegMode(handle : BaseApi) : PageSegMode
  fun base_api_get_regions = TessBaseAPIGetRegions(handle : BaseApi, pixa : Pixa**) : Boxa*
  fun base_api_get_source_y_resolution = TessBaseAPIGetSourceYResolution(handle : BaseApi) : LibC::Int
  fun base_api_get_string_variable = TessBaseAPIGetStringVariable(handle : BaseApi, name : LibC::Char*) : LibC::Char*
  fun base_api_get_strips = TessBaseAPIGetStrips(handle : BaseApi, pixa : Pixa**, blockids : LibC::Int**) : Boxa*
  fun base_api_get_text_direction = TessBaseAPIGetTextDirection(handle : BaseApi, out_offset : LibC::Int*, out_slope : LibC::Float*) : LibC::Int
  fun base_api_get_textlines = TessBaseAPIGetTextlines(handle : BaseApi, pixa : Pixa**, blockids : LibC::Int**) : Boxa*
  fun base_api_get_textlines1 = TessBaseAPIGetTextlines1(handle : BaseApi, raw_image : LibC::Int, raw_padding : LibC::Int, pixa : Pixa**, blockids : LibC::Int**, paraids : LibC::Int**) : Boxa*
  fun base_api_get_thresholded_image = TessBaseAPIGetThresholdedImage(handle : BaseApi) : Pix*
  fun base_api_get_thresholded_image_scale_factor = TessBaseAPIGetThresholdedImageScaleFactor(handle : BaseApi) : LibC::Int
  fun base_api_get_tsv_text = TessBaseAPIGetTsvText(handle : BaseApi, page_number : LibC::Int) : LibC::Char*
  fun base_api_get_unichar = TessBaseAPIGetUnichar(handle : BaseApi, unichar_id : LibC::Int) : LibC::Char*
  fun base_api_get_unlv_text = TessBaseAPIGetUNLVText(handle : BaseApi) : LibC::Char*
  fun base_api_get_utf8_text = TessBaseAPIGetUTF8Text(handle : BaseApi) : LibC::Char*
  fun base_api_get_word_str_box_text = TessBaseAPIGetWordStrBoxText(handle : BaseApi, page_number : LibC::Int) : LibC::Char*
  fun base_api_get_words = TessBaseAPIGetWords(handle : BaseApi, pixa : Pixa**) : Boxa*
  fun base_api_init_for_analyse_page = TessBaseAPIInitForAnalysePage(handle : BaseApi)
  fun base_api_init1 = TessBaseAPIInit1(handle : BaseApi, datapath : LibC::Char*, language : LibC::Char*, oem : OcrEngineMode, configs : LibC::Char**, configs_size : LibC::Int) : LibC::Int
  fun base_api_init2 = TessBaseAPIInit2(handle : BaseApi, datapath : LibC::Char*, language : LibC::Char*, oem : OcrEngineMode) : LibC::Int
  fun base_api_init3 = TessBaseAPIInit3(handle : BaseApi, datapath : LibC::Char*, language : LibC::Char*) : LibC::Int
  fun base_api_init4 = TessBaseAPIInit4(handle : BaseApi, datapath : LibC::Char*, language : LibC::Char*, mode : OcrEngineMode, configs : LibC::Char**, configs_size : LibC::Int, vars_vec : LibC::Char**, vars_values : LibC::Char**, vars_vec_size : LibC::SizeT, set_only_non_debug_params : LibC::Int) : LibC::Int
  fun base_api_init5 = TessBaseAPIInit5(handle : BaseApi, data : LibC::Char*, data_size : LibC::Int, language : LibC::Char*, mode : OcrEngineMode, configs : LibC::Char**, configs_size : LibC::Int, vars_vec : LibC::Char**, vars_values : LibC::Char**, vars_vec_size : LibC::SizeT, set_only_non_debug_params : LibC::Int) : LibC::Int
  fun base_api_is_valid_word = TessBaseAPIIsValidWord(handle : BaseApi, word : LibC::Char*) : LibC::Int
  fun base_api_mean_text_conf = TessBaseAPIMeanTextConf(handle : BaseApi) : LibC::Int
  fun base_api_num_dawgs = TessBaseAPINumDawgs(handle : BaseApi) : LibC::Int
  fun base_api_oem = TessBaseAPIOem(handle : BaseApi) : OcrEngineMode
  fun base_api_print_variables = TessBaseAPIPrintVariables(handle : BaseApi, fp : File*)
  fun base_api_print_variables_to_file = TessBaseAPIPrintVariablesToFile(handle : BaseApi, filename : LibC::Char*) : LibC::Int
  fun base_api_process_page = TessBaseAPIProcessPage(handle : BaseApi, pix : Pix*, page_index : LibC::Int, filename : LibC::Char*, retry_config : LibC::Char*, timeout_millisec : LibC::Int, renderer : ResultRenderer) : LibC::Int
  fun base_api_process_pages = TessBaseAPIProcessPages(handle : BaseApi, filename : LibC::Char*, retry_config : LibC::Char*, timeout_millisec : LibC::Int, renderer : ResultRenderer) : LibC::Int
  fun base_api_read_config_file = TessBaseAPIReadConfigFile(handle : BaseApi, filename : LibC::Char*)
  fun base_api_read_debug_config_file = TessBaseAPIReadDebugConfigFile(handle : BaseApi, filename : LibC::Char*)
  fun base_api_recognize = TessBaseAPIRecognize(handle : BaseApi, monitor : EtextDesc) : LibC::Int
  fun base_api_rect = TessBaseAPIRect(handle : BaseApi, imagedata : UInt8*, bytes_per_pixel : LibC::Int, bytes_per_line : LibC::Int, left : LibC::Int, top : LibC::Int, width : LibC::Int, height : LibC::Int) : LibC::Char*
  fun base_api_set_debug_variable = TessBaseAPISetDebugVariable(handle : BaseApi, name : LibC::Char*, value : LibC::Char*) : LibC::Int
  fun base_api_set_image = TessBaseAPISetImage(handle : BaseApi, imagedata : UInt8*, width : LibC::Int, height : LibC::Int, bytes_per_pixel : LibC::Int, bytes_per_line : LibC::Int)
  fun base_api_set_image2 = TessBaseAPISetImage2(handle : BaseApi, pix : Pix*)
  fun base_api_set_input_image = TessBaseAPISetInputImage(handle : BaseApi, pix : Pix*)
  fun base_api_set_input_name = TessBaseAPISetInputName(handle : BaseApi, name : LibC::Char*)
  fun base_api_set_min_orientation_margin = TessBaseAPISetMinOrientationMargin(handle : BaseApi, margin : LibC::Double)
  fun base_api_set_output_name = TessBaseAPISetOutputName(handle : BaseApi, name : LibC::Char*)
  fun base_api_set_page_seg_mode = TessBaseAPISetPageSegMode(handle : BaseApi, mode : PageSegMode)
  fun base_api_set_rectangle = TessBaseAPISetRectangle(handle : BaseApi, left : LibC::Int, top : LibC::Int, width : LibC::Int, height : LibC::Int)
  fun base_api_set_source_resolution = TessBaseAPISetSourceResolution(handle : BaseApi, ppi : LibC::Int)
  fun base_api_set_variable = TessBaseAPISetVariable(handle : BaseApi, name : LibC::Char*, value : LibC::Char*) : LibC::Int
  fun base_get_block_text_orientations = TessBaseGetBlockTextOrientations(handle : BaseApi, block_orientation : LibC::Int**, vertical_writing : LibC::Int**)
  fun box_text_renderer_create = TessBoxTextRendererCreate(outputbase : LibC::Char*) : ResultRenderer
  fun choice_iterator_confidence = TessChoiceIteratorConfidence(handle : ChoiceIterator) : LibC::Float
  fun choice_iterator_delete = TessChoiceIteratorDelete(handle : ChoiceIterator)
  fun choice_iterator_get_utf8_text = TessChoiceIteratorGetUTF8Text(handle : ChoiceIterator) : LibC::Char*
  fun choice_iterator_next = TessChoiceIteratorNext(handle : ChoiceIterator) : LibC::Int
  fun delete_int_array = TessDeleteIntArray(arr : LibC::Int*)
  fun delete_result_renderer = TessDeleteResultRenderer(renderer : ResultRenderer)
  fun delete_text = TessDeleteText(text : LibC::Char*)
  fun delete_text_array = TessDeleteTextArray(arr : LibC::Char**)
  fun h_ocr_renderer_create = TessHOcrRendererCreate(outputbase : LibC::Char*) : ResultRenderer
  fun h_ocr_renderer_create2 = TessHOcrRendererCreate2(outputbase : LibC::Char*, font_info : LibC::Int) : ResultRenderer
  fun lstm_box_renderer_create = TessLSTMBoxRendererCreate(outputbase : LibC::Char*) : ResultRenderer
  fun monitor_create = TessMonitorCreate : EtextDesc
  fun monitor_delete = TessMonitorDelete(monitor : EtextDesc)
  fun monitor_get_cancel_this = TessMonitorGetCancelThis(monitor : EtextDesc) : Void*
  fun monitor_get_progress = TessMonitorGetProgress(monitor : EtextDesc) : LibC::Int
  fun monitor_set_cancel_func = TessMonitorSetCancelFunc(monitor : EtextDesc, cancel_func : CancelFunc)
  fun monitor_set_cancel_this = TessMonitorSetCancelThis(monitor : EtextDesc, cancel_this : Void*)
  fun monitor_set_deadline_m_secs = TessMonitorSetDeadlineMSecs(monitor : EtextDesc, deadline : LibC::Int)
  fun monitor_set_progress_func = TessMonitorSetProgressFunc(monitor : EtextDesc, progress_func : ProgressFunc)
  fun page_iterator_baseline = TessPageIteratorBaseline(handle : PageIterator, level : PageIteratorLevel, x1 : LibC::Int*, y1 : LibC::Int*, x2 : LibC::Int*, y2 : LibC::Int*) : LibC::Int
  fun page_iterator_begin = TessPageIteratorBegin(handle : PageIterator)
  fun page_iterator_block_type = TessPageIteratorBlockType(handle : PageIterator) : PolyBlockType
  fun page_iterator_bounding_box = TessPageIteratorBoundingBox(handle : PageIterator, level : PageIteratorLevel, left : LibC::Int*, top : LibC::Int*, right : LibC::Int*, bottom : LibC::Int*) : LibC::Int
  fun page_iterator_copy = TessPageIteratorCopy(handle : PageIterator) : PageIterator
  fun page_iterator_delete = TessPageIteratorDelete(handle : PageIterator)
  fun page_iterator_get_binary_image = TessPageIteratorGetBinaryImage(handle : PageIterator, level : PageIteratorLevel) : Pix*
  fun page_iterator_get_image = TessPageIteratorGetImage(handle : PageIterator, level : PageIteratorLevel, padding : LibC::Int, original_image : Pix*, left : LibC::Int*, top : LibC::Int*) : Pix*
  fun page_iterator_is_at_beginning_of = TessPageIteratorIsAtBeginningOf(handle : PageIterator, level : PageIteratorLevel) : LibC::Int
  fun page_iterator_is_at_final_element = TessPageIteratorIsAtFinalElement(handle : PageIterator, level : PageIteratorLevel, element : PageIteratorLevel) : LibC::Int
  fun page_iterator_next = TessPageIteratorNext(handle : PageIterator, level : PageIteratorLevel) : LibC::Int
  fun page_iterator_orientation = TessPageIteratorOrientation(handle : PageIterator, orientation : Orientation*, writing_direction : WritingDirection*, textline_order : TextlineOrder*, deskew_angle : LibC::Float*)
  fun page_iterator_paragraph_info = TessPageIteratorParagraphInfo(handle : PageIterator, justification : ParagraphJustification*, is_list_item : LibC::Int*, is_crown : LibC::Int*, first_line_indent : LibC::Int*)
  fun pdf_renderer_create = TessPDFRendererCreate(outputbase : LibC::Char*, datadir : LibC::Char*, textonly : LibC::Int) : ResultRenderer
  fun result_iterator_confidence = TessResultIteratorConfidence(handle : ResultIterator, level : PageIteratorLevel) : LibC::Float
  fun result_iterator_copy = TessResultIteratorCopy(handle : ResultIterator) : ResultIterator
  fun result_iterator_delete = TessResultIteratorDelete(handle : ResultIterator)
  fun result_iterator_get_choice_iterator = TessResultIteratorGetChoiceIterator(handle : ResultIterator) : ChoiceIterator
  fun result_iterator_get_page_iterator = TessResultIteratorGetPageIterator(handle : ResultIterator) : PageIterator
  fun result_iterator_get_page_iterator_const = TessResultIteratorGetPageIteratorConst(handle : ResultIterator) : PageIterator
  fun result_iterator_get_utf8_text = TessResultIteratorGetUTF8Text(handle : ResultIterator, level : PageIteratorLevel) : LibC::Char*
  fun result_iterator_next = TessResultIteratorNext(handle : ResultIterator, level : PageIteratorLevel) : LibC::Int
  fun result_iterator_symbol_is_dropcap = TessResultIteratorSymbolIsDropcap(handle : ResultIterator) : LibC::Int
  fun result_iterator_symbol_is_subscript = TessResultIteratorSymbolIsSubscript(handle : ResultIterator) : LibC::Int
  fun result_iterator_symbol_is_superscript = TessResultIteratorSymbolIsSuperscript(handle : ResultIterator) : LibC::Int
  fun result_iterator_word_font_attributes = TessResultIteratorWordFontAttributes(handle : ResultIterator, is_bold : LibC::Int*, is_italic : LibC::Int*, is_underlined : LibC::Int*, is_monospace : LibC::Int*, is_serif : LibC::Int*, is_smallcaps : LibC::Int*, pointsize : LibC::Int*, font_id : LibC::Int*) : LibC::Char*
  fun result_iterator_word_is_from_dictionary = TessResultIteratorWordIsFromDictionary(handle : ResultIterator) : LibC::Int
  fun result_iterator_word_is_numeric = TessResultIteratorWordIsNumeric(handle : ResultIterator) : LibC::Int
  fun result_iterator_word_recognition_language = TessResultIteratorWordRecognitionLanguage(handle : ResultIterator) : LibC::Char*
  fun result_renderer_add_image = TessResultRendererAddImage(renderer : ResultRenderer, api : BaseApi) : LibC::Int
  fun result_renderer_begin_document = TessResultRendererBeginDocument(renderer : ResultRenderer, title : LibC::Char*) : LibC::Int
  fun result_renderer_end_document = TessResultRendererEndDocument(renderer : ResultRenderer) : LibC::Int
  fun result_renderer_extention = TessResultRendererExtention(renderer : ResultRenderer) : LibC::Char*
  fun result_renderer_image_num = TessResultRendererImageNum(renderer : ResultRenderer) : LibC::Int
  fun result_renderer_insert = TessResultRendererInsert(renderer : ResultRenderer, next : ResultRenderer)
  fun result_renderer_next = TessResultRendererNext(renderer : ResultRenderer) : ResultRenderer
  fun result_renderer_title = TessResultRendererTitle(renderer : ResultRenderer) : LibC::Char*
  fun text_renderer_create = TessTextRendererCreate(outputbase : LibC::Char*) : ResultRenderer
  fun tsv_renderer_create = TessTsvRendererCreate(outputbase : LibC::Char*) : ResultRenderer
  fun unlv_renderer_create = TessUnlvRendererCreate(outputbase : LibC::Char*) : ResultRenderer
  fun version = TessVersion : LibC::Char*
  fun word_str_box_renderer_create = TessWordStrBoxRendererCreate(outputbase : LibC::Char*) : ResultRenderer
end
