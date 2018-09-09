/*jslint */
/*global AdobeEdge: false, window: false, document: false, console:false, alert: false */
(function (compId) {

    "use strict";
    var im='images/',
        aud='media/',
        vid='media/',
        js='js/',
        fonts = {
        },
        opts = {
            'gAudioPreloadPreference': 'auto',
            'gVideoPreloadPreference': 'auto'
        },
        resources = [
        ],
        scripts = [
        ],
        symbols = {
            "stage": {
                version: "5.0.1",
                minimumCompatibleVersion: "5.0.0",
                build: "5.0.1.386",
                scaleToFit: "none",
                centerStage: "both",
                resizeInstances: false,
                content: {
                    dom: [
                        {
                            id: 'bg1',
                            type: 'image',
                            rect: ['-294px', '-24px', '1344px', '549px', 'auto', 'auto'],
                            fill: ["rgba(0,0,0,0)",im+"bg1.jpg",'0px','0px']
                        },
                        {
                            id: 'Text',
                            type: 'text',
                            rect: ['629px', '242px', '348px', '44px', 'auto', 'auto'],
                            opacity: '0',
                            text: "Easy Online   Banking",
                            align: "center",
                            font: ['Arial Black, Gadget, sans-serif', [30, "px"], "rgba(0,0,0,1)", "900", "none", "normal", "break-word", "normal"]
                        },
                        {
                            id: 'geek',
                            type: 'image',
                            rect: ['39px', '493px', '878px', '549px', 'auto', 'auto'],
                            fill: ["rgba(0,0,0,0)",im+"geek.png",'0px','0px']
                        },
                        {
                            id: 'Logo',
                            symbolName: 'Logo',
                            type: 'rect',
                            rect: ['1124px', '109px', '46', '56', 'auto', 'auto']
                        },
                        {
                            id: 'Started',
                            symbolName: 'Started',
                            type: 'rect',
                            rect: ['637', '249px', '348', '44', 'auto', 'auto'],
                            cursor: 'pointer',
                            opacity: '1',
                            transform: [[],[],[],['1','0.71074']]
                        },
                        {
                            id: 'Rectangle',
                            display: 'none',
                            type: 'rect',
                            rect: ['1124px', '-9px', '1139px', '94px', 'auto', 'auto'],
                            fill: ["rgba(0,0,0,1.00)"],
                            stroke: [0,"rgb(0, 0, 0)","none"]
                        },
                        {
                            id: 'RectangleCopy10',
                            display: 'none',
                            type: 'rect',
                            rect: ['1124px', '85px', '1139px', '94px', 'auto', 'auto'],
                            fill: ["rgba(0,0,0,1.00)"],
                            stroke: [0,"rgb(0, 0, 0)","none"]
                        },
                        {
                            id: 'RectangleCopy11',
                            display: 'none',
                            type: 'rect',
                            rect: ['1124px', '177px', '1139px', '94px', 'auto', 'auto'],
                            fill: ["rgba(0,0,0,1.00)"],
                            stroke: [0,"rgb(0, 0, 0)","none"]
                        },
                        {
                            id: 'RectangleCopy12',
                            display: 'none',
                            type: 'rect',
                            rect: ['1124px', '250px', '1139px', '94px', 'auto', 'auto'],
                            fill: ["rgba(0,0,0,1.00)"],
                            stroke: [0,"rgb(0, 0, 0)","none"]
                        },
                        {
                            id: 'RectangleCopy13',
                            display: 'none',
                            type: 'rect',
                            rect: ['1124px', '326px', '1139px', '94px', 'auto', 'auto'],
                            fill: ["rgba(0,0,0,1.00)"],
                            stroke: [0,"rgb(0, 0, 0)","none"]
                        },
                        {
                            id: 'RectangleCopy14',
                            display: 'none',
                            type: 'rect',
                            rect: ['1124px', '415px', '1139px', '94px', 'auto', 'auto'],
                            fill: ["rgba(0,0,0,1.00)"],
                            stroke: [0,"rgb(0, 0, 0)","none"]
                        },
                        {
                            id: 'bg_2',
                            display: 'none',
                            type: 'image',
                            rect: ['-15px', '-9px', '1139px', '518px', 'auto', 'auto'],
                            opacity: '0',
                            fill: ["rgba(0,0,0,0)",im+"bg%202.jpg",'0px','0px']
                        },
                        {
                            id: 'Rectangle2',
                            display: 'none',
                            type: 'rect',
                            rect: ['-15px', '-91px', '1139px', '82px', 'auto', 'auto'],
                            fill: ["rgba(0,39,212,0.75)"],
                            stroke: [0,"rgb(0, 0, 0)","none"]
                        },
                        {
                            id: 'Text3',
                            display: 'none',
                            type: 'text',
                            rect: ['267px', '0px', '575px', '44px', 'auto', 'auto'],
                            text: "Easy Online Banking",
                            align: "center",
                            font: ['Times New Roman, Times, serif', [48, "px"], "rgba(255,255,255,1)", "500", "none solid rgb(255, 255, 255)", "normal", "break-word", ""]
                        },
                        {
                            id: 'Back2',
                            symbolName: 'Back',
                            display: 'none',
                            type: 'rect',
                            rect: ['22', '15px', '34', '31', 'auto', 'auto'],
                            cursor: 'pointer'
                        },
                        {
                            id: 'In',
                            symbolName: 'In',
                            display: 'none',
                            type: 'rect',
                            rect: ['50px', '216px', '160', '160', 'auto', 'auto'],
                            cursor: 'pointer',
                            opacity: '0',
                            transform: [[],[],[],['0.8','0.8']]
                        },
                        {
                            id: 'Welcome2',
                            symbolName: 'Welcome',
                            display: 'none',
                            type: 'rect',
                            rect: ['330', '202', '450', '171', 'auto', 'auto'],
                            cursor: 'default'
                        },
                        {
                            id: 'Up',
                            symbolName: 'Up',
                            display: 'none',
                            type: 'rect',
                            rect: ['731', '224px', '160', '160', 'auto', 'auto'],
                            cursor: 'pointer',
                            transform: [[],[],[],['0.8','0.8']]
                        }
                    ],
                    style: {
                        '${Stage}': {
                            isStage: true,
                            rect: ['null', 'null', '1110px', '500px', 'auto', 'auto'],
                            overflow: 'hidden',
                            fill: ["rgba(255,255,255,1)"]
                        }
                    }
                },
                timeline: {
                    duration: 8700,
                    autoPlay: true,
                    labels: {
                        "screen2": 5750
                    },
                    data: [
                        [
                            "eid140",
                            "display",
                            5750,
                            0,
                            "easeOutBack",
                            "${Up}",
                            'none',
                            'block'
                        ],
                        [
                            "eid71",
                            "display",
                            5750,
                            0,
                            "easeOutBounce",
                            "${Rectangle}",
                            'none',
                            'block'
                        ],
                        [
                            "eid125",
                            "display",
                            5750,
                            0,
                            "easeOutBack",
                            "${Back2}",
                            'none',
                            'block'
                        ],
                        [
                            "eid101",
                            "left",
                            6300,
                            350,
                            "linear",
                            "${RectangleCopy12}",
                            '1124px',
                            '-15px'
                        ],
                        [
                            "eid158",
                            "opacity",
                            8200,
                            500,
                            "easeOutBack",
                            "${Up}",
                            '0',
                            '1'
                        ],
                        [
                            "eid157",
                            "left",
                            8200,
                            500,
                            "easeOutBack",
                            "${Up}",
                            '624px',
                            '880px'
                        ],
                        [
                            "eid70",
                            "display",
                            5750,
                            0,
                            "linear",
                            "${bg_2}",
                            'none',
                            'block'
                        ],
                        [
                            "eid115",
                            "opacity",
                            6900,
                            300,
                            "linear",
                            "${bg_2}",
                            '0',
                            '1'
                        ],
                        [
                            "eid105",
                            "left",
                            6500,
                            350,
                            "linear",
                            "${RectangleCopy13}",
                            '1124px',
                            '-15px'
                        ],
                        [
                            "eid172",
                            "left",
                            7900,
                            500,
                            "easeOutBack",
                            "${Welcome2}",
                            '53px',
                            '309px'
                        ],
                        [
                            "eid141",
                            "display",
                            5750,
                            0,
                            "easeOutBack",
                            "${In}",
                            'none',
                            'block'
                        ],
                        [
                            "eid173",
                            "opacity",
                            7900,
                            500,
                            "easeOutBack",
                            "${Welcome2}",
                            '0',
                            '1'
                        ],
                        [
                            "eid106",
                            "display",
                            6500,
                            0,
                            "easeOutBounce",
                            "${RectangleCopy13}",
                            'none',
                            'block'
                        ],
                        [
                            "eid102",
                            "display",
                            6300,
                            0,
                            "easeOutBounce",
                            "${RectangleCopy12}",
                            'none',
                            'block'
                        ],
                        [
                            "eid1",
                            "left",
                            0,
                            5000,
                            "linear",
                            "${bg1}",
                            '-43px',
                            '-294px'
                        ],
                        [
                            "eid170",
                            "left",
                            7600,
                            500,
                            "easeOutBack",
                            "${In}",
                            '-206px',
                            '50px'
                        ],
                        [
                            "eid43",
                            "top",
                            3000,
                            1011,
                            "easeOutBounce",
                            "${Started}",
                            '789px',
                            '249px'
                        ],
                        [
                            "eid94",
                            "left",
                            5900,
                            350,
                            "linear",
                            "${RectangleCopy10}",
                            '1124px',
                            '-15px'
                        ],
                        [
                            "eid171",
                            "opacity",
                            7600,
                            500,
                            "easeOutBack",
                            "${In}",
                            '0',
                            '1'
                        ],
                        [
                            "eid39",
                            "opacity",
                            2000,
                            500,
                            "easeOutBack",
                            "${Text}",
                            '0',
                            '1'
                        ],
                        [
                            "eid122",
                            "top",
                            7300,
                            400,
                            "easeOutBack",
                            "${Text3}",
                            '-72px',
                            '0px'
                        ],
                        [
                            "eid93",
                            "display",
                            5900,
                            0,
                            "easeOutBounce",
                            "${RectangleCopy10}",
                            'none',
                            'block'
                        ],
                        [
                            "eid110",
                            "display",
                            6700,
                            0,
                            "easeOutBounce",
                            "${RectangleCopy14}",
                            'none',
                            'block'
                        ],
                        [
                            "eid3",
                            "top",
                            3000,
                            1011,
                            "easeOutBounce",
                            "${geek}",
                            '493px',
                            '-40px'
                        ],
                        [
                            "eid120",
                            "display",
                            5750,
                            0,
                            "easeOutBack",
                            "${Text3}",
                            'none',
                            'block'
                        ],
                        [
                            "eid37",
                            "top",
                            2000,
                            500,
                            "easeOutBack",
                            "${Text}",
                            '242px',
                            '206px'
                        ],
                        [
                            "eid165",
                            "display",
                            5750,
                            0,
                            "easeOutBack",
                            "${Welcome2}",
                            'none',
                            'block'
                        ],
                        [
                            "eid97",
                            "left",
                            6100,
                            350,
                            "linear",
                            "${RectangleCopy11}",
                            '1124px',
                            '-15px'
                        ],
                        [
                            "eid98",
                            "display",
                            6100,
                            0,
                            "easeOutBounce",
                            "${RectangleCopy11}",
                            'none',
                            'block'
                        ],
                        [
                            "eid118",
                            "top",
                            7300,
                            400,
                            "easeOutBack",
                            "${Rectangle2}",
                            '-91px',
                            '-19px'
                        ],
                        [
                            "eid126",
                            "top",
                            7300,
                            400,
                            "easeOutBack",
                            "${Back2}",
                            '-59px',
                            '13px'
                        ],
                        [
                            "eid116",
                            "display",
                            5750,
                            0,
                            "linear",
                            "${Rectangle2}",
                            'none',
                            'block'
                        ],
                        [
                            "eid2",
                            "top",
                            0,
                            5000,
                            "linear",
                            "${bg1}",
                            '-24px',
                            '-25px'
                        ],
                        [
                            "eid78",
                            "left",
                            5750,
                            350,
                            "linear",
                            "${Rectangle}",
                            '1124px',
                            '-15px'
                        ],
                        [
                            "eid45",
                            "scaleY",
                            4011,
                            0,
                            "easeOutBounce",
                            "${Started}",
                            '0.71074',
                            '0.71074'
                        ],
                        [
                            "eid109",
                            "left",
                            6700,
                            350,
                            "linear",
                            "${RectangleCopy14}",
                            '1124px',
                            '-15px'
                        ]
                    ]
                }
            },
            "Logo": {
                version: "5.0.1",
                minimumCompatibleVersion: "5.0.0",
                build: "5.0.1.386",
                scaleToFit: "none",
                centerStage: "none",
                resizeInstances: false,
                content: {
                    dom: [
                        {
                            transform: [[], ['90'], [], ['0.7341']],
                            id: 'Layer-4',
                            type: 'image',
                            rect: ['-480px', '14px', '90px', '56px', 'auto', 'auto'],
                            fill: ['rgba(0,0,0,0)', 'images/Layer-4.svg', '0px', '0px']
                        },
                        {
                            transform: [[], ['90'], [0, 0, 0], [1, 1, 1]],
                            id: 'Layer-2',
                            type: 'image',
                            rect: ['0px', '0px', '46px', '56px', 'auto', 'auto'],
                            fill: ['rgba(0,0,0,0)', 'images/Layer-2.svg', '0px', '0px']
                        },
                        {
                            transform: [[], ['270'], [], ['1.43629', '-1']],
                            id: 'Layer-2Copy3',
                            type: 'image',
                            rect: ['-458px', '22px', '46px', '56px', 'auto', 'auto'],
                            fill: ['rgba(0,0,0,0)', 'images/Layer-2.svg', '0px', '0px']
                        },
                        {
                            transform: [[], ['180'], [], ['0.83562', '0.81995']],
                            rect: ['-376px', '-8px', '90px', '56px', 'auto', 'auto'],
                            id: 'Layer-4Copy',
                            opacity: '0',
                            type: 'image',
                            fill: ['rgba(0,0,0,0)', 'images/Layer-4.svg', '0px', '0px']
                        },
                        {
                            transform: [[], ['180'], [], ['0.83562', '0.81995']],
                            rect: ['-376px', '36px', '90px', '56px', 'auto', 'auto'],
                            id: 'Layer-4Copy2',
                            opacity: '0',
                            type: 'image',
                            fill: ['rgba(0,0,0,0)', 'images/Layer-4.svg', '0px', '0px']
                        },
                        {
                            transform: [[], ['90'], [], ['1', '-1.00002']],
                            id: 'Layer-2Copy7',
                            type: 'image',
                            rect: ['-236px', '-1px', '46px', '56px', 'auto', 'auto'],
                            fill: ['rgba(0,0,0,0)', 'images/Layer-2.svg', '0px', '0px']
                        },
                        {
                            transform: [[], ['270'], [], ['1.43629']],
                            id: 'Layer-2Copy6',
                            type: 'image',
                            rect: ['-236px', '22px', '46px', '56px', 'auto', 'auto'],
                            fill: ['rgba(0,0,0,0)', 'images/Layer-2.svg', '0px', '0px']
                        },
                        {
                            transform: [[], ['90'], [], ['0.7341', '-1.00002']],
                            id: 'Layer-4Copy4',
                            type: 'image',
                            rect: ['-257px', '14px', '90px', '56px', 'auto', 'auto'],
                            fill: ['rgba(0,0,0,0)', 'images/Layer-4.svg', '0px', '0px']
                        }
                    ],
                    style: {
                        '${symbolSelector}': {
                            rect: [null, null, '46px', '56px']
                        }
                    }
                },
                timeline: {
                    duration: 4775,
                    autoPlay: true,
                    labels: {
                        "jump": 4012
                    },
                    data: [
                        [
                            "eid27",
                            "left",
                            1475,
                            725,
                            "easeOutBack",
                            "${Layer-2Copy6}",
                            '222px',
                            '-245px'
                        ],
                        [
                            "eid10",
                            "rotateZ",
                            1250,
                            500,
                            "easeOutBack",
                            "${Layer-4Copy}",
                            '180deg',
                            '0deg'
                        ],
                        [
                            "eid12",
                            "top",
                            1250,
                            500,
                            "easeOutBack",
                            "${Layer-4Copy2}",
                            '-5px',
                            '36px'
                        ],
                        [
                            "eid58",
                            "top",
                            4200,
                            175,
                            "linear",
                            "${Layer-4Copy2}",
                            '36px',
                            '16px'
                        ],
                        [
                            "eid63",
                            "top",
                            4375,
                            175,
                            "linear",
                            "${Layer-4Copy2}",
                            '16px',
                            '36px'
                        ],
                        [
                            "eid65",
                            "top",
                            4375,
                            200,
                            "linear",
                            "${Layer-2Copy7}",
                            '-1px',
                            '-17px'
                        ],
                        [
                            "eid68",
                            "top",
                            4575,
                            200,
                            "linear",
                            "${Layer-2Copy7}",
                            '-17px',
                            '-1px'
                        ],
                        [
                            "eid64",
                            "top",
                            4375,
                            200,
                            "linear",
                            "${Layer-2Copy6}",
                            '22px',
                            '6px'
                        ],
                        [
                            "eid67",
                            "top",
                            4575,
                            200,
                            "linear",
                            "${Layer-2Copy6}",
                            '6px',
                            '22px'
                        ],
                        [
                            "eid52",
                            "top",
                            4000,
                            200,
                            "linear",
                            "${Layer-2}",
                            '0px',
                            '-16px'
                        ],
                        [
                            "eid55",
                            "top",
                            4200,
                            200,
                            "linear",
                            "${Layer-2}",
                            '-16px',
                            '0px'
                        ],
                        [
                            "eid28",
                            "left",
                            1475,
                            725,
                            "easeOutBack",
                            "${Layer-4Copy4}",
                            '201px',
                            '-266px'
                        ],
                        [
                            "eid7",
                            "left",
                            750,
                            725,
                            "easeOutBack",
                            "${Layer-4}",
                            '-22px',
                            '-480px'
                        ],
                        [
                            "eid8",
                            "left",
                            750,
                            725,
                            "easeOutBack",
                            "${Layer-2Copy3}",
                            '0px',
                            '-458px'
                        ],
                        [
                            "eid20",
                            "opacity",
                            1250,
                            500,
                            "easeOutBack",
                            "${Layer-4Copy2}",
                            '0',
                            '1'
                        ],
                        [
                            "eid53",
                            "top",
                            4000,
                            200,
                            "linear",
                            "${Layer-2Copy3}",
                            '22px',
                            '6px'
                        ],
                        [
                            "eid56",
                            "top",
                            4200,
                            200,
                            "linear",
                            "${Layer-2Copy3}",
                            '6px',
                            '22px'
                        ],
                        [
                            "eid22",
                            "opacity",
                            1250,
                            500,
                            "easeOutBack",
                            "${Layer-4Copy}",
                            '0',
                            '1'
                        ],
                        [
                            "eid59",
                            "top",
                            4200,
                            175,
                            "linear",
                            "${Layer-4Copy}",
                            '-8px',
                            '-28px'
                        ],
                        [
                            "eid61",
                            "top",
                            4375,
                            175,
                            "linear",
                            "${Layer-4Copy}",
                            '-28px',
                            '-8px'
                        ],
                        [
                            "eid6",
                            "left",
                            750,
                            725,
                            "easeOutBack",
                            "${Layer-2}",
                            '0px',
                            '-458px'
                        ],
                        [
                            "eid26",
                            "left",
                            1475,
                            725,
                            "easeOutBack",
                            "${Layer-2Copy7}",
                            '222px',
                            '-245px'
                        ],
                        [
                            "eid54",
                            "top",
                            4000,
                            200,
                            "linear",
                            "${Layer-4}",
                            '14px',
                            '-2px'
                        ],
                        [
                            "eid57",
                            "top",
                            4200,
                            200,
                            "linear",
                            "${Layer-4}",
                            '-2px',
                            '14px'
                        ],
                        [
                            "eid66",
                            "top",
                            4375,
                            200,
                            "linear",
                            "${Layer-4Copy4}",
                            '14px',
                            '-2px'
                        ],
                        [
                            "eid69",
                            "top",
                            4575,
                            200,
                            "linear",
                            "${Layer-4Copy4}",
                            '-2px',
                            '14px'
                        ]
                    ]
                }
            },
            "Started": {
                version: "5.0.1",
                minimumCompatibleVersion: "5.0.0",
                build: "5.0.1.386",
                scaleToFit: "none",
                centerStage: "none",
                resizeInstances: false,
                content: {
                    dom: [
                        {
                            rect: ['0px', '0px', '348px', '44px', 'auto', 'auto'],
                            borderRadius: ['10px', '10px', '10px', '10px'],
                            id: 'RoundRect',
                            stroke: [0, 'rgba(0,0,0,1)', 'none'],
                            type: 'rect',
                            fill: ['rgba(192,192,192,1)', [270, [['rgba(2,8,98,1.00)', 16], ['rgba(7,26,193,1.00)', 62], ['rgba(15,84,184,1.00)', 100]]]]
                        },
                        {
                            font: ['Lucida Sans Unicode, Lucida Grande, sans-serif', [32, 'px'], 'rgba(255,255,255,1.00)', '500', 'none', '', 'break-word', ''],
                            type: 'text',
                            id: 'Text2',
                            text: 'Get Started',
                            align: 'center',
                            rect: ['65px', '-2px', '204px', '28px', 'auto', 'auto']
                        }
                    ],
                    style: {
                        '${symbolSelector}': {
                            rect: [null, null, '348px', '44px']
                        }
                    }
                },
                timeline: {
                    duration: 1000,
                    autoPlay: true,
                    labels: {
                        "startover": 500
                    },
                    data: [
                        [
                            "eid42",
                            "background-image",
                            500,
                            500,
                            "linear",
                            "${RoundRect}",
                            [270,[['rgba(0,103,255,1.00)',28],['rgba(14,22,151,1.00)',91]]],
                            [270,[['rgba(9,15,119,1.00)',17],['rgba(29,111,232,1.00)',100]]]
                        ]
                    ]
                }
            },
            "Back": {
                version: "5.0.1",
                minimumCompatibleVersion: "5.0.0",
                build: "5.0.1.386",
                scaleToFit: "none",
                centerStage: "none",
                resizeInstances: false,
                content: {
                    dom: [
                        {
                            type: 'image',
                            fi: [0, 0, 1, 1, 0, 0, 0, 0, 'rgba(0,0,0,0)', 0, 0, 0],
                            filter: [0, 0, 1, 1, 0, 0, 0, 0, 'rgba(0,0,0,0)', 0, 0, 0],
                            id: 'btnBack2',
                            rect: ['0px', '0px', '34px', '31px', 'auto', 'auto'],
                            fill: ['rgba(0,0,0,0)', 'images/btnBack.png', '0px', '0px']
                        }
                    ],
                    style: {
                        '${symbolSelector}': {
                            rect: [null, null, '34px', '31px']
                        }
                    }
                },
                timeline: {
                    duration: 1000,
                    autoPlay: true,
                    labels: {
                        "backover": 500
                    },
                    data: [
                        [
                            "eid127",
                            "filter.invert",
                            500,
                            500,
                            "linear",
                            "${btnBack2}",
                            '0',
                            '1'
                        ],
                        [
                            "eid128",
                            "filter.contrast",
                            500,
                            500,
                            "linear",
                            "${btnBack2}",
                            '1',
                            '2'
                        ]
                    ]
                }
            },
            "In": {
                version: "5.0.1",
                minimumCompatibleVersion: "5.0.0",
                build: "5.0.1.386",
                scaleToFit: "none",
                centerStage: "none",
                resizeInstances: false,
                content: {
                    dom: [
                        {
                            transform: [[], ['360'], [], ['0.22', '0.22']],
                            id: 'Sign_in',
                            type: 'image',
                            rect: ['-320px', '-320px', '800px', '800px', 'auto', 'auto'],
                            fill: ['rgba(0,0,0,0)', 'images/Sign%20in.png', '0px', '0px']
                        }
                    ],
                    style: {
                        '${symbolSelector}': {
                            rect: [null, null, '160px', '160px']
                        }
                    }
                },
                timeline: {
                    duration: 868,
                    autoPlay: true,
                    labels: {
                        "inover": 500
                    },
                    data: [
                        [
                            "eid142",
                            "scaleX",
                            500,
                            367,
                            "linear",
                            "${Sign_in}",
                            '0.2',
                            '0.23'
                        ],
                        [
                            "eid144",
                            "rotateZ",
                            500,
                            184,
                            "linear",
                            "${Sign_in}",
                            '0deg',
                            '180deg'
                        ],
                        [
                            "eid148",
                            "rotateZ",
                            684,
                            184,
                            "linear",
                            "${Sign_in}",
                            '180deg',
                            '360deg'
                        ],
                        [
                            "eid143",
                            "scaleY",
                            500,
                            367,
                            "linear",
                            "${Sign_in}",
                            '0.2',
                            '0.23'
                        ]
                    ]
                }
            },
            "Up": {
                version: "5.0.1",
                minimumCompatibleVersion: "5.0.0",
                build: "5.0.1.386",
                scaleToFit: "none",
                centerStage: "none",
                resizeInstances: false,
                content: {
                    dom: [
                        {
                            transform: [[], [], [], ['0.23', '0.23']],
                            id: 'Sign_up',
                            type: 'image',
                            rect: ['-320px', '-320px', '800px', '800px', 'auto', 'auto'],
                            fill: ['rgba(0,0,0,0)', 'images/Sign%20up.png', '0px', '0px']
                        }
                    ],
                    style: {
                        '${symbolSelector}': {
                            rect: [null, null, '160px', '160px']
                        }
                    }
                },
                timeline: {
                    duration: 868,
                    autoPlay: true,
                    labels: {
                        "upover": 500
                    },
                    data: [
                        [
                            "eid151",
                            "rotateZ",
                            500,
                            184,
                            "linear",
                            "${Sign_up}",
                            '0deg',
                            '180deg'
                        ],
                        [
                            "eid152",
                            "rotateZ",
                            684,
                            184,
                            "linear",
                            "${Sign_up}",
                            '180deg',
                            '360deg'
                        ],
                        [
                            "eid149",
                            "scaleX",
                            500,
                            367,
                            "linear",
                            "${Sign_up}",
                            '0.2',
                            '0.23'
                        ],
                        [
                            "eid150",
                            "scaleY",
                            500,
                            367,
                            "linear",
                            "${Sign_up}",
                            '0.2',
                            '0.23'
                        ]
                    ]
                }
            },
            "Welcome": {
                version: "5.0.1",
                minimumCompatibleVersion: "5.0.0",
                build: "5.0.1.386",
                scaleToFit: "none",
                centerStage: "none",
                resizeInstances: false,
                content: {
                    dom: [
                        {
                            transform: [[], [], [], ['0.18', '0.18']],
                            id: 'Welcome',
                            type: 'image',
                            rect: ['-1025px', '-390px', '2500px', '950px', 'auto', 'auto'],
                            fill: ['rgba(0,0,0,0)', 'images/Welcome.jpg', '0px', '0px']
                        },
                        {
                            font: ['Arial Black, Gadget, sans-serif', [44, 'px'], 'rgba(1,1,1,1.00)', '900', 'none solid rgb(255, 255, 255)', 'normal', 'break-word', 'normal'],
                            type: 'text',
                            text: 'E<br>O<br>B',
                            id: 'Text4',
                            opacity: '1',
                            align: 'center',
                            rect: ['371px', '-8px', '48px', '171px', 'auto', 'auto']
                        },
                        {
                            rect: ['-8px', '-13px', '469px', '203px', 'auto', 'auto'],
                            opacity: '0',
                            id: 'Rectangle3',
                            stroke: [0, 'rgb(0, 0, 0)', 'none'],
                            type: 'rect',
                            fill: ['rgba(0,0,0,0.68)']
                        },
                        {
                            font: ['Palatino Linotype, Book Antigua, Palatino, serif', [44, 'px'], 'rgba(255,255,255,1.00)', '900', 'none solid rgb(1, 1, 1)', 'normal', 'break-word', 'normal'],
                            type: 'text',
                            text: 'Welcome <br>To',
                            id: 'Text5',
                            opacity: '0',
                            align: 'center',
                            rect: ['17px', '12px', '309px', '145px', 'auto', 'auto']
                        },
                        {
                            font: ['Arial Black, Gadget, sans-serif', [44, 'px'], 'rgba(255,255,255,1.00)', '900', 'none solid rgb(255, 255, 255)', 'normal', 'break-word', 'normal'],
                            type: 'text',
                            text: 'E<br>O<br>B',
                            id: 'Text4Copy',
                            opacity: '0',
                            align: 'center',
                            rect: ['371px', '-8px', '48px', '171px', 'auto', 'auto']
                        }
                    ],
                    style: {
                        '${symbolSelector}': {
                            overflow: 'hidden',
                            rect: [null, null, '450px', '171px']
                        }
                    }
                },
                timeline: {
                    duration: 4400,
                    autoPlay: true,
                    labels: {
                        "welover": 4000
                    },
                    data: [
                        [
                            "eid177",
                            "opacity",
                            4000,
                            400,
                            "linear",
                            "${Text5}",
                            '0',
                            '1'
                        ],
                        [
                            "eid175",
                            "opacity",
                            4000,
                            400,
                            "linear",
                            "${Text4Copy}",
                            '0',
                            '1'
                        ],
                        [
                            "eid179",
                            "opacity",
                            4000,
                            400,
                            "linear",
                            "${Rectangle3}",
                            '0',
                            '1'
                        ],
                        [
                            "eid180",
                            "opacity",
                            4000,
                            400,
                            "linear",
                            "${Text4}",
                            '1',
                            '0'
                        ]
                    ]
                }
            }
        };

    AdobeEdge.registerCompositionDefn(compId, symbols, fonts, scripts, resources, opts);

    if (!window.edge_authoring_mode) AdobeEdge.getComposition(compId).load("Banner_edgeActions.js");
})("EDGE-2024045");
