<?php namespace App\Libraries;

use Dompdf\Dompdf;
use Dompdf\Options;

class Pdf extends Dompdf{

    public $filename = 'laporan.pdf';

    public function load_view($view, $data = array()){

        // $options = new Options();
        // $options->set('isRemoteEnabled', TRUE);

        $dompdf = new Dompdf();

        // $html = $this->ci()->load->view($view, $data, TRUE);
        $this->load_html(view($view, $data));
        // Render the PDF
        $this->render();
        // Output the generated PDF to Browser
        $this->stream($this->filename, array("Attachment" => false));
    }
}