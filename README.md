# SDXL-Inpainting
Desktop application to mask an image and use SDXL inpainting to paint part of the image using AI.

Features include creating a mask within the application, generating an image using a text and negative prompt, and storing the history of previous inpainting work.

The SDXL Desktop client is a powerful UI for inpainting images using Stable Diffusion XL.

Built with [Delphi](https://www.embarcadero.com/products/delphi/) using the FireMonkey framework this client works on Windows, macOS, and Linux (and maybe Android+iOS) with a single codebase and single UI. At the moment it is specifically set up for Windows.

It also features a REST integration with Replicate.com for providing Generate Image functionality within the client. You need to sign up for an API key to access that functionality. Replicate models can be run in the cloud or locally via docker.

```
docker run -d -p 5000:5000 --gpus=all r8.im/catacolabs/sdxl-ad-inpaint@sha256:9c0cb4c579c54432431d96c70924afcca18983de872e8a221777fb1416253359
curl http://localhost:5000/predictions -X POST \
-d '{"input": {
  "image": "https://url/to/file",
    "product_fill": "...",
    "prompt": "...",
    "negative_prompt": "...",
    "img_size": "...",
    "scheduler": "...",
    "num_inference_steps": "...",
    "guidance_scale": "...",
    "condition_scale": "...",
    "num_refine_steps": "...",
    "apply_img": "...",
    "seed": "..."
  }}'
```

# SDXL Inpainting Desktop client Screeshot on Windows
![SDXL Inpainting Desktop client on Windows](/screenshot.png)

Requires [Skia4Delphi](https://github.com/skia4delphi/skia4delphi) to compile.

Other Delphi AI clients:

[Stable Diffusion Desktop Client](https://github.com/FMXExpress/Stable-Diffusion-Desktop-Client)

[CodeDroidAI](https://github.com/FMXExpress/CodeDroidAI)

[ControlNet Sketch To Image](https://github.com/FMXExpress/ControlNet-Sketch-To-Image)

[AutoBlogAI](https://github.com/FMXExpress/AutoBlogAI)

[AI Code Translator](https://github.com/FMXExpress/AI-Code-Translator)

[AI Playground](https://github.com/FMXExpress/AI-Playground-DesktopClient)

[Song Writer AI](https://github.com/FMXExpress/Song-Writer-AI)

[Stable Diffusion Text To Image Prompts](https://github.com/FMXExpress/Stable-Diffusion-Text-To-Image-Prompts)

[Generative AI Prompts](https://github.com/FMXExpress/Generative-AI-Prompts)

[Dreambooth Desktop Client](https://github.com/FMXExpress/DreamBooth-Desktop-Client)

[Text To Vector Desktop Client](https://github.com/FMXExpress/Text-To-Vector-Desktop-Client)
